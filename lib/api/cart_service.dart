import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market/model/cart.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_service.g.dart';
@injectable
@RestApi()
abstract class CartService {
  @factoryMethod
  factory CartService(Dio dio, {@Named('baseUrl') String baseUrl}) = _CartService;

  @POST('carts/add')
  Future<Cart> createCart(@Body() Cart cart);
}
