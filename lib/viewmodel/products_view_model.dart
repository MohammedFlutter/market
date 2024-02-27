import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:market/exceptions/network_exceptions.dart';
import 'package:market/model/product.dart';
import 'package:market/model/user_info.dart';
import 'package:market/repo/api_result.dart';
import 'package:market/repo/cart_repo.dart';
import 'package:market/repo/product_repo.dart';

import 'package:market/view/widgets/custom_snake_bar.dart';

@injectable
class ProductsViewModel extends ChangeNotifier {
  ProductsViewModel({
    required ProductRepo productRepo,
    required CartRepo cartRepo,
  })  : _cartRepo = cartRepo,
        _productRepo = productRepo;

  final CartRepo _cartRepo;
  final ProductRepo _productRepo;

  int? _totalQuantity;
  UserInfo? _userInfo;
  List<Product>? _products;

  int get totalQuantity => _totalQuantity ?? 0;

  set totalQuantity(int value) {
    _totalQuantity = value;
    notifyListeners();
  } //

  UserInfo? get userInfo => _userInfo;

  set userInfo(UserInfo? value) {
    _userInfo = value;
    notifyListeners();
  }

  List<Product>? get products => _products;

  set products(List<Product>? value) {
    if (value == null) return;
    _products = value;
    notifyListeners();
  }

  Future<void> fetchTotalQuantity() async {
    final localCart = await _cartRepo.getLocalCart();
    totalQuantity = localCart.totalQuantity ?? 0;
  }

  Future<void> fetchProducts({
    required BuildContext context,
    String? category,
  }) async {
    ApiResult<List<Product>> result;
    if (category != null) {
      result = await _productRepo.getProductsByCategory(category);
    } else {
      result = await _productRepo.getProducts(limit: 100);
    }

    result.when(
      success: (data) {
        products = data;
      },
      failure: (exceptions) {
        final errorMessage = NetworkExceptions.getErrorMessage(exceptions);

        debugPrint(errorMessage);
        if (!context.mounted) return;
        CustomSnakeBar.show(
            context: context, isError: true, message: errorMessage);
      },
    );
  }
}
