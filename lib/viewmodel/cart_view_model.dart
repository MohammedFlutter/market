import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:market/repo/cart_repo.dart';
import 'package:market/view/widgets/custom_dialog.dart';
import 'package:market/view/widgets/custom_snake_bar.dart';

import '../model/cart.dart';

@injectable
class CartViewModel extends ChangeNotifier {
  CartViewModel({required CartRepo cartRepo}) : _cartRepo = cartRepo;

  final CartRepo _cartRepo;

  Cart? _cart;

  Cart? get cart => _cart;

  set cart(Cart? value) {
    _cart = value;
    notifyListeners();
  }

  Future<void> deleteProduct(int productId) async {
    cart = await _cartRepo.deleteProduct(productId);
    _cartRepo.setLocalCart(cart!);
  }

  Future<void> checkout(BuildContext context) async {
    CustomDialog.showLoadingDialog(context);
    final isSuccess = await _cartRepo.checkout();
    if (!context.mounted) return;
    Navigator.pop(context);

    if (isSuccess) {
      CustomSnakeBar.show(
          context: context, isError: false, message: 'checkout Successfully');
      Navigator.pop(context);
    }
  }

  Future<void> fetchCart() async {
    cart = await _cartRepo.getLocalCart();
  }
}
