import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    int? id,
    String? title,
    String? description,
    num? price,
    num? discountPercentage,
    num? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
    int? quantity,
    num? discountedPrice,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class ProductList with _$ProductList {

  const factory ProductList({
    required List<Product> products,
    required int total,
    required int skip,
    required int limit,
  }) = _ProductList;

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);
}
// class Product {
//   int? id;
//   String? title;
//   String? description;
//   num? price;
//   num? discountPercentage;
//   num? rating;
//   int? stock;
//   String? brand;
//   String? category;
//   String? thumbnail;
//   List<String>? images;
//   int? quantity;
//   num? discountedPrice;
//
//   Product();
//
//   Product.fromJson(Map<String, dynamic> map) {
//     this.id = map["id"];
//     this.title = map["title"];
//     this.description = map["description"];
//     this.price = map["price"];
//     this.discountPercentage = map["discountPercentage"];
//     this.rating = map["rating"];
//     this.stock = map["stock"];
//     this.brand = map["brand"];
//     this.category = map["category"];
//     this.thumbnail = map["thumbnail"];
//     this.images = List<String>.from(map["images"]);
//     this.quantity= map["quantity"];
//     // this.discountedPrice= map["discountedPrice"];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": this.id,
//       "title": this.title,
//       "description": this.description,
//       "price": this.price,
//       "discountPercentage": this.discountPercentage,
//       "rating": this.rating,
//       "stock": this.stock,
//       "brand": this.brand,
//       "category": this.category,
//       "thumbnail": this.thumbnail,
//       "images": this.images,
//       "quantity": this.quantity,
//       // "discountedPrice": this.discountedPrice,
//
//
//     };
//   }
// }
