import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:market/api/auth_service.dart';
import 'package:market/exceptions/network_exceptions.dart';
import 'package:market/model/login_credential.dart';
import 'package:market/model/token.dart';
import 'package:market/repo/api_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthRepo {
  AuthRepo(
      {required AuthService authService, required FlutterSecureStorage storage ,required SharedPreferences preferences})
      : _preferences = preferences, _authService = authService,
        _storage = storage;

  final AuthService _authService;
  final FlutterSecureStorage _storage;
  final SharedPreferences _preferences;
  static const _tokenKey = 'token';

  //todo unnecessary ApiResult<Token> don't need toke
  Future<ApiResult<Token>> login(LoginCredential loginCredential) async {
    try {
      final token = await _authService.login(loginCredential);
      _store(token);

      return ApiResult.success(token);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  void _store(Token token) {
    _storage.write(key: _tokenKey, value: jsonEncode(token.toJson()));
  }

  Future<Token?> getToken() async {
    final value = await _storage.read(key: _tokenKey);
    //todo check expiration date and return null if its expired

    return value == null ? null : Token.fromJson(jsonDecode(value));
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: _tokenKey);

    //todo check expiration date
    return token != null;
  }

  Future<void> logout() async {
    Future.wait([
      _storage.deleteAll(),
    _preferences.clear(),

    ]);
    // await _storage.delete(key: _tokenKey);
    // await preferences.clear();
  }
}
