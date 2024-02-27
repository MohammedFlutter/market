import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_credential.freezed.dart';

part 'login_credential.g.dart';

@freezed
class LoginCredential with _$LoginCredential {
  const factory LoginCredential ({
    required String username, required String password
  })=_LoginCredential;

  factory LoginCredential.fromJson(Map<String, dynamic> json)=>
      _$LoginCredentialFromJson(json);

}