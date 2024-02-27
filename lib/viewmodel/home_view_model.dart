import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:market/exceptions/network_exceptions.dart';
import 'package:market/model/product.dart';
import 'package:market/model/user_info.dart';
import 'package:market/repo/auth_repo.dart';
import 'package:market/repo/cart_repo.dart';
import 'package:market/repo/product_repo.dart';
import 'package:market/repo/user_info_repo.dart';
import 'package:market/routes.dart';
import 'package:market/view/widgets/custom_snake_bar.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._productRepo,
      {required AuthRepo authRepo,
      required CartRepo cartRepo,
      required UserRepo userRepo})
      : _userRepo = userRepo,
        _cartRepo = cartRepo,
        _authRepo = authRepo;

  final UserRepo _userRepo;
  final CartRepo _cartRepo;
  final AuthRepo _authRepo;
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

  Future<void> fetchUser(BuildContext context) async {
    final localUser = _userRepo.getLocalUserInfo();
    if (localUser != null) {
      userInfo = localUser;
      return;
    }
    final result = await _userRepo.getRemoteUserInfo();
    result.when(
      success: (user) {
        userInfo = user;
      },
      failure: (exceptions) {
        final errorMessage = NetworkExceptions.getErrorMessage(exceptions);
        if (!context.mounted) return;
        CustomSnakeBar.show(
            context: context, isError: true, message: errorMessage);
      },
    );
  }

  Future<void> fetchTotalQuantity() async {
    final localCart = await _cartRepo.getLocalCart();
    totalQuantity = localCart.totalQuantity ?? 0;
  }

  Future<void> fetchProducts({
    required BuildContext context,
    String? category,
    int? limit,
  }) async {
    final result = await _productRepo.getProducts(limit: 10);

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

  // result.when(
  //   success: (data) {
  //      products = data;
  //   },
  //   failure: (exceptions) {
  //     final errorMessage = NetworkExceptions.getErrorMessage(exceptions);
  //     debugPrint(errorMessage);
  //   },
  // );
  // }

  Future<void> logout(BuildContext context)async {

  _authRepo.logout;
    if (!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, MyRouter.loginRoute,(route) => false,);
  }
}
