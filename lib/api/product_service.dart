import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market/model/product.dart';
import 'package:retrofit/retrofit.dart';
part 'product_service.g.dart';

@injectable
@RestApi()
abstract class ProductService{

  @factoryMethod
  factory ProductService(Dio dio,{@Named('baseUrl') String baseUrl})=_ProductService;

  @GET('products?limit={limit}&select=title,price,thumbnail')
  Future<ProductList> getProducts({@Path() int? limit =10});

  @GET('products/category/{category}?&select=title,price,thumbnail')
  Future<ProductList> getProductsByCategory(@Path() String category);

  @GET('products/{id}')
  Future<Product> getProduct(@Path() int id);

}