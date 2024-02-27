import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    String? gender,
    String? email,
    String? phone,
    String? username,
    String? image,
    Address? address,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}



@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(name: 'address')
    String? street,
    String? city,
    Coordinate? coordinates,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Coordinate with _$Coordinate {
  const factory Coordinate({
    double? lat,
    double? lng,
  }) = _Coordinate;

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);
}

// class Coordinate {
//   double? lat;
//   double? lng;
//
//   Coordinate();
//
//   Coordinate.fromJson(Map<String, dynamic> map) {
//     this.lat = map["lat"];
//     ;
//     this.lng = map["lng"];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "lat": this.lat,
//       "lng": this.lng,
//     };
//   }
// }
