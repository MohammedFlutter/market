import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:market/repo/auth_repo.dart';
import 'package:market/routes.dart';

@module
abstract class ApiModule {
  @Named('baseUrl')
  String get baseUrl => 'https://dummyjson.com/';

  @lazySingleton
  Dio createDio() {
    final dio = Dio();

    dio.options.headers = {'Content-Type': 'application/json'};

    dio
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20)
      ..options.sendTimeout = const Duration(seconds: 20);

    dio.interceptors.add(
      LogInterceptor(
          error: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: false,
          request: true),
    );
    // dio.interceptors.add(getIt<TokenInterceptor>());

    return dio;
  }
}

@injectable
class TokenInterceptor extends Interceptor {
  final AuthRepo authRepo;

  final GlobalKey<NavigatorState> key;

  TokenInterceptor({required this.key, required this.authRepo});

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await authRepo.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer ${token.token}';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      authRepo.logout();
      key.currentState
          ?.pushNamedAndRemoveUntil(MyRouter.loginRoute, (route) => false);
    }

    handler.next(err);
  }
}

// @injectable
// class TokenInterceptor extends Interceptor {
//   // final Dio dio;
//   // final Dio refreshTokenDio; // Another Dio instance for refreshing tokens
//   final AuthRepo repo;
//   final GlobalKey<> key;
//
//   TokenInterceptor( this.repo);
//
//   @override
//   Future onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final accessToken = await repo.getToken(); //from local  : layer repo
//     if (accessToken != null) {
//       options.headers['Authorization'] = 'Bearer ${accessToken.token}';
//     }
//
//     return super.onRequest(options, handler);
//   }
//
//   @override
//   Future onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       // Token expired or unauthorized, try to refresh the token
//       // try {
//       // String refreshToken = await getRefreshToken(); // from local storage repo
//       // String newAccessToken = await refreshTokenDio.post(
//       //   '/refresh_token', // Replace with your actual refresh token endpoint
//       //   data: {'refresh_token': refreshToken},
//       // ).then((response) => response.data['access_token'] as String);//from api repo
//       //
//       // // Save the new access token
//       // saveAccessToken(newAccessToken);//save to local storage
//       //
//       // // Retry the original request with the new access token
//       // err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';//repo
//       // return dio.fetch(err.requestOptions);
//       // } catch (refreshError) {
//       //   // Handle token refresh failure or redirect to login
//       //   // ...
//       // }
//     }
//
//     return super.onError(err, handler);
//   }
// }

//
// class TokenInterceptor extends Interceptor {
//   final Dio? dio;
//   final Dio? refreshTokenDio; // Another Dio instance for refreshing tokens
//
//   TokenInterceptor(this.dio, this.refreshTokenDio);
//
//   @override
//   Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//
//
//     String accessToken = await getAccessToken();//from local  : layer repo
//
//     if (accessToken != null) {
//       options.headers['Authorization'] = 'Bearer $accessToken';
//     }
//
//     return super.onRequest(options, handler);
//   }
//
//
//
//   @override
//   Future onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       // Token expired or unauthorized, try to refresh the token
//       try {
//         String refreshToken = await getRefreshToken(); // from local storage repo
//         String newAccessToken = await refreshTokenDio.post(
//           '/refresh_token', // Replace with your actual refresh token endpoint
//           data: {'refresh_token': refreshToken},
//         ).then((response) => response.data['access_token'] as String);//from api repo
//
//         // Save the new access token
//         saveAccessToken(newAccessToken);//save to local storage
//
//         // Retry the original request with the new access token
//         err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';//repo
//         return dio.fetch(err.requestOptions);
//       } catch (refreshError) {
//         // Handle token refresh failure or redirect to login
//         // ...
//       }
//     }
//
//     return super.onError(err, handler);
//   }
//
// }
//
// class CustomInterceptors extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // TODO: implement onRequest
//     super.onRequest(options, handler);
//   }
// @override
// Future onRequest(RequestOptions options) async {
//   final auth = await Authentication.authenticated();
//   final token = await Authentication.getToken();
//   if (auth) options.headers["Authorization"] = "Bearer $token";
//   options.headers["Accept"] = "application/json";
//   options.headers["X-Spree-Token"] = API_KEY;
//   return super.onRequest(options);
// }
//
// @override
// Future onError(DioError err) async {
//   print(err.toString());
//   print(err.message);
//   print(err.request.uri);
//   // if (err.response.statusCode == 401) {
//   //  final res = await AuthRepository().refresh();
//   //print(res.data);
//   //}
//   return super.onError(err);
// }
