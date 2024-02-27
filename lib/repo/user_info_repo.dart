import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:market/api/user_service.dart';
import 'package:market/exceptions/network_exceptions.dart';
import 'package:market/model/user_info.dart';
import 'package:market/repo/api_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class UserRepo {
  UserRepo(
      {required SharedPreferences preferences,
      required UserService userService})
      : _userService = userService,
        _preferences = preferences;

  final SharedPreferences _preferences;
  final UserService _userService;

  static const _useKey = 'me';

  UserInfo? getLocalUserInfo() {
    final value = _preferences.getString(_useKey);
    return value == null ? null : UserInfo.fromJson(jsonDecode(value));
  }

  Future<void> setLocalUserInfo(UserInfo userInfo) async {
    await _preferences.setString(_useKey, jsonEncode(userInfo.toJson()));
  }

  Future<ApiResult<UserInfo>> getRemoteUserInfo() async {
    try {
      final value = await _userService.getUserInfo();
      return ApiResult.success(value);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
