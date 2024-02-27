import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:market/api/cart_service.dart';
import 'package:market/api/user_service.dart';
import 'package:market/exceptions/network_exceptions.dart';
import 'package:market/model/cart.dart';
import 'package:market/model/product.dart';
import 'package:market/model/user_info.dart';
import 'package:market/repo/api_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

// cart in api , i cant update or delete new cart
// i try solve this problem by make it in local  then cart will be sent to Api
// to calculation fields  like total price
// api not use token, for there must send userId
@injectable
class CartRepo {
  const CartRepo({
    required CartService cartService,
    required UserService userService,
    required SharedPreferences preferences,
  }) : _preferences = preferences, _cartService = cartService, _userService = userService;

  final UserService _userService;
  final CartService _cartService;
  final SharedPreferences _preferences;

  Future<ApiResult<Cart>> addCart(Cart cart) async {
    try {
      final value = await _cartService.createCart(cart);

      return ApiResult.success(value);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<Cart> getLocalCart() async {
    final String? storedCartJson = _preferences.getString('cart');

    if (storedCartJson == null) {
      final String? storedUserJson = _preferences.getString('me');
      final UserInfo user = storedUserJson != null
          ? UserInfo.fromJson(jsonDecode(storedUserJson))
          : await _userService.getUserInfo();

      return Cart(userId: user.id, products: []);
    }

    return Cart.fromJson(jsonDecode(storedCartJson));
  }

  Future<void> setLocalCart(Cart cart) async {
    await _preferences.setString('cart', jsonEncode(cart.toJson()));
  }

  Future<Cart> addProduct(
    int productId,
    int quantity,
  ) async {
    final Cart cart = await getLocalCart();

    final List<Product> matchingProducts =
        cart.products!.where((product) => product.id == productId).toList();

    if (matchingProducts.isEmpty) {
      cart.products?.add(Product(id: productId, quantity: quantity));
    } else {
      final Product existingProduct = matchingProducts.first;
      cart.products?.remove(existingProduct);

      // final int newQuantity = existingProduct.quantity ?? 0 + quantity;
      cart.products?.add(Product(id: productId, quantity: quantity));
    }

    return _cartService.createCart(cart);
  }

  Future<Cart> updateProduct(int productId, int quantity) async {
    final Cart cart = await getLocalCart();
    assert(cart.products == null);

    final List<Product> matchingProducts =
        cart.products!.where((product) => product.id == productId).toList();

    if (matchingProducts.isNotEmpty) {
      final Product existingProduct = matchingProducts.first;
      cart.products?.remove(existingProduct);
    }
    cart.products?.add(Product(id: productId, quantity: quantity));

    return _cartService.createCart(cart);
  }

  Future<Cart> deleteProduct(int productId) async {
    final Cart cart = await getLocalCart();

    final List<Product> matchingProducts =
        cart.products!.where((product) => product.id == productId).toList();

    if (matchingProducts.isNotEmpty) {
      final Product existingProduct = matchingProducts.first;
      cart.products?.remove(existingProduct);
    }
    if(cart.products?.isEmpty??true){
      return cart.copyWith(products: [],total: 0,totalProducts: 0,discountedTotal: 0,totalQuantity: 0);
    }
    return _cartService.createCart(cart);
  }

  Future<bool> checkout(){
    return  _preferences.remove('cart');
  }

}
