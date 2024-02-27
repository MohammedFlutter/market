import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:market/injection/di_init.dart';
import 'package:market/repo/auth_repo.dart';
import 'package:market/routes.dart';

import '../injection/api_module.dart';

@injectable
class SplashViewModel extends ChangeNotifier {
  SplashViewModel({required this.authRepo}) ;

  final AuthRepo authRepo;

  Future<void> checkLoginStatus(BuildContext context) async {
    final isLoggedIn = await authRepo.isLoggedIn();

    if (!context.mounted) return;

    if (isLoggedIn) {

      getIt<Dio>().interceptors.add(getIt<TokenInterceptor>());
      // Navigator.pushNamed(context, MyRouter.homeRoute);
      Navigator.pushNamedAndRemoveUntil(context, MyRouter.homeRoute,(route) =>false,);
    } else {

      Navigator.pushNamedAndRemoveUntil(context, MyRouter.loginRoute,(route) =>false,);
    }

    // notifyListeners();
  }
}
