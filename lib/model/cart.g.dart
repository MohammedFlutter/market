// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      userId: json['userId'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as num?,
      discountedTotal: json['discountedTotal'] as num?,
      totalProducts: json['totalProducts'] as int?,
      totalQuantity: json['totalQuantity'] as int?,
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'products': instance.products,
      'total': instance.total,
      'discountedTotal': instance.discountedTotal,
      'totalProducts': instance.totalProducts,
      'totalQuantity': instance.totalQuantity,
    };
