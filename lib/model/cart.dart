
import 'product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Cart with _$Cart{
    const factory Cart ({
      int? userId,
      List<Product>? products,
      num? total,
      num? discountedTotal,
      int? totalProducts,
      int? totalQuantity,
    })=_Cart;
    factory Cart.fromJson(Map<String,dynamic> json)=>_$CartFromJson(json);

}

