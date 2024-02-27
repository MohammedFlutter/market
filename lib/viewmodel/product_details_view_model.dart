import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:market/exceptions/network_exceptions.dart';
import 'package:market/model/product.dart';
import 'package:market/repo/cart_repo.dart';
import 'package:market/repo/product_repo.dart';
import 'package:market/view/widgets/custom_dialog.dart';
import 'package:market/view/widgets/custom_snake_bar.dart';

@injectable
class ProductDetailsViewModel extends ChangeNotifier {
  ProductDetailsViewModel(
      {@factoryParam Product? product,
      required CartRepo cartRepo,
      required ProductRepo productRepo})
      : _product = product!,
        _cartRepo = cartRepo,
        _productRepo = productRepo;

  final CartRepo _cartRepo;
  final ProductRepo _productRepo;

  Product _product;
  int? _quantity;

  ///fetch full product fields
  Future<void> fetchProduct({required BuildContext context}) async {
    final result = await _productRepo.getProduct(_product.id!);
    result.when(
      success: (data) {
        product = data;
      },
      failure: (exception) {
        final errorMessage = NetworkExceptions.getErrorMessage(exception);
        debugPrint(errorMessage);
        CustomSnakeBar.show(
            context: context, isError: true, message: errorMessage);
      },
    );
  }

  Future<void> fetchQuantity() async {
    final cart = await _cartRepo.getLocalCart();
    final temp = cart.products?.where((element) => element.id == _product.id);
    if (temp?.isNotEmpty ?? false) {
      quantity = temp!.first.quantity;
    } else {
      quantity = 0;
    }
  }

  int? get quantity => _quantity;

  Product get product => _product;

  set quantity(int? value) {
    _quantity = value;
    notifyListeners();
  }

  set product(Product value) {
    _product = value;
    notifyListeners();
  }

  void decrement() {
    if (_quantity == null || product.stock == null) return;

    quantity = (_quantity == null || _quantity! <= 0) ? 0 : _quantity! - 1;
  }

  void increment() {
    if (_quantity == null || product.stock == null) return;

    quantity = (_quantity == null || _quantity! < 1) ? 1 : _quantity! + 1;

    if (quantity! >= (product.stock ?? 0)) quantity = product.stock!;
  }

  Future<void> addToCart(BuildContext context) async {
    if (_quantity == 0 ) return;
    CustomDialog.showLoadingDialog(context);
    final cart = await _cartRepo.addProduct(_product.id!, _quantity!);
    if (!context.mounted) return;
    Navigator.pop(context);
    _cartRepo.setLocalCart(cart);
    if (!context.mounted) return;
    CustomSnakeBar.show(
        context: context, isError: false, message: 'Product added to cart');
    Navigator.pop(context);
  }
}
