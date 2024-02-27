// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginCredential _$LoginCredentialFromJson(Map<String, dynamic> json) {
  return _LoginCredential.fromJson(json);
}

/// @nodoc
mixin _$LoginCredential {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginCredentialCopyWith<LoginCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCredentialCopyWith<$Res> {
  factory $LoginCredentialCopyWith(
          LoginCredential value, $Res Function(LoginCredential) then) =
      _$LoginCredentialCopyWithImpl<$Res, LoginCredential>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginCredentialCopyWithImpl<$Res, $Val extends LoginCredential>
    implements $LoginCredentialCopyWith<$Res> {
  _$LoginCredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginCredentialImplCopyWith<$Res>
    implements $LoginCredentialCopyWith<$Res> {
  factory _$$LoginCredentialImplCopyWith(_$LoginCredentialImpl value,
          $Res Function(_$LoginCredentialImpl) then) =
      __$$LoginCredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginCredentialImplCopyWithImpl<$Res>
    extends _$LoginCredentialCopyWithImpl<$Res, _$LoginCredentialImpl>
    implements _$$LoginCredentialImplCopyWith<$Res> {
  __$$LoginCredentialImplCopyWithImpl(
      _$LoginCredentialImpl _value, $Res Function(_$LoginCredentialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$LoginCredentialImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginCredentialImpl implements _LoginCredential {
  const _$LoginCredentialImpl({required this.username, required this.password});

  factory _$LoginCredentialImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginCredentialImplFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginCredential(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginCredentialImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginCredentialImplCopyWith<_$LoginCredentialImpl> get copyWith =>
      __$$LoginCredentialImplCopyWithImpl<_$LoginCredentialImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginCredentialImplToJson(
      this,
    );
  }
}

abstract class _LoginCredential implements LoginCredential {
  const factory _LoginCredential(
      {required final String username,
      required final String password}) = _$LoginCredentialImpl;

  factory _LoginCredential.fromJson(Map<String, dynamic> json) =
      _$LoginCredentialImpl.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginCredentialImplCopyWith<_$LoginCredentialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
