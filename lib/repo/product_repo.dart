import 'package:injectable/injectable.dart';
import 'package:market/api/product_service.dart';
import 'package:market/exceptions/network_exceptions.dart';
import 'package:market/model/product.dart';
import 'package:market/repo/api_result.dart';

@injectable
class ProductRepo {
  ProductRepo({required ProductService productService}) : _productService = productService;

  final ProductService _productService;

  Future<ApiResult<List<Product>>> getProducts({int? limit}) async {
    try {
      final value = await _productService.getProducts(limit:limit );
      return ApiResult.success(value.products);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<Product>>> getProductsByCategory(
      String category) async {
    try {
      final value = await _productService.getProductsByCategory(category);
      return ApiResult.success(value.products);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<Product>> getProduct(int productId) async {
    try {
      final value = await _productService.getProduct(productId);
      return ApiResult.success(value);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

}
