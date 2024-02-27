// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      maidenName: json['maidenName'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'maidenName': instance.maidenName,
      'age': instance.age,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'image': instance.image,
      'address': instance.address,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      street: json['address'] as String?,
      city: json['city'] as String?,
      coordinates: json['coordinates'] == null
          ? null
          : Coordinate.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'address': instance.street,
      'city': instance.city,
      'coordinates': instance.coordinates,
    };

_$CoordinateImpl _$$CoordinateImplFromJson(Map<String, dynamic> json) =>
    _$CoordinateImpl(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CoordinateImplToJson(_$CoordinateImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
