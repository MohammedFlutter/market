// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  int? get userId => throw _privateConstructorUsedError;
  List<Product>? get products => throw _privateConstructorUsedError;
  num? get total => throw _privateConstructorUsedError;
  num? get discountedTotal => throw _privateConstructorUsedError;
  int? get totalProducts => throw _privateConstructorUsedError;
  int? get totalQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {int? userId,
      List<Product>? products,
      num? total,
      num? discountedTotal,
      int? totalProducts,
      int? totalQuantity});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? products = freezed,
    Object? total = freezed,
    Object? discountedTotal = freezed,
    Object? totalProducts = freezed,
    Object? totalQuantity = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num?,
      discountedTotal: freezed == discountedTotal
          ? _value.discountedTotal
          : discountedTotal // ignore: cast_nullable_to_non_nullable
              as num?,
      totalProducts: freezed == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuantity: freezed == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? userId,
      List<Product>? products,
      num? total,
      num? discountedTotal,
      int? totalProducts,
      int? totalQuantity});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? products = freezed,
    Object? total = freezed,
    Object? discountedTotal = freezed,
    Object? totalProducts = freezed,
    Object? totalQuantity = freezed,
  }) {
    return _then(_$CartImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num?,
      discountedTotal: freezed == discountedTotal
          ? _value.discountedTotal
          : discountedTotal // ignore: cast_nullable_to_non_nullable
              as num?,
      totalProducts: freezed == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuantity: freezed == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  const _$CartImpl(
      {this.userId,
      this.products,
      this.total,
      this.discountedTotal,
      this.totalProducts,
      this.totalQuantity});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final int? userId;
  @override
  final List<Product>? products;
  @override
  final num? total;
  @override
  final num? discountedTotal;
  @override
  final int? totalProducts;
  @override
  final int? totalQuantity;

  @override
  String toString() {
    return 'Cart(userId: $userId, products: $products, total: $total, discountedTotal: $discountedTotal, totalProducts: $totalProducts, totalQuantity: $totalQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discountedTotal, discountedTotal) ||
                other.discountedTotal == discountedTotal) &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(products),
      total,
      discountedTotal,
      totalProducts,
      totalQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {final int? userId,
      final List<Product>? products,
      final num? total,
      final num? discountedTotal,
      final int? totalProducts,
      final int? totalQuantity}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  int? get userId;
  @override
  List<Product>? get products;
  @override
  num? get total;
  @override
  num? get discountedTotal;
  @override
  int? get totalProducts;
  @override
  int? get totalQuantity;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
