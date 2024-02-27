import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:market/exceptions/network_exceptions.dart';
import 'package:market/injection/api_module.dart';
import 'package:market/injection/di_init.dart';
import 'package:market/model/login_credential.dart';
import 'package:market/repo/auth_repo.dart';
import 'package:market/routes.dart';
import 'package:market/view/widgets/custom_snake_bar.dart';

enum LoginState {
  initial,
  loading,
  success,
  error,
}
@injectable
class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this._authRepo);

  final AuthRepo _authRepo;
  LoginState _loginState = LoginState.initial;

  LoginState get loginState => _loginState;

  Future<void> onLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    _loginState = LoginState.loading;
    notifyListeners();
    final result = await _authRepo
        .login(LoginCredential(username: email, password: password));

    result.when(
      success: (data) {
        _loginState = LoginState.success;
        notifyListeners();

        if (!context.mounted) return;
        getIt<Dio>().interceptors.add(getIt<TokenInterceptor>());

        Navigator.of(context).pushReplacementNamed(MyRouter.homeRoute);

        //
      },
      failure: (exceptions) {
        var s =NetworkExceptions.getErrorMessage(exceptions);

        _loginState = LoginState.error;
        notifyListeners();
        if (!context.mounted) return;
        CustomSnakeBar.show(
            context: context,
            isError: true,
            message: NetworkExceptions.getErrorMessage(exceptions));
      },
    );
  }


}
