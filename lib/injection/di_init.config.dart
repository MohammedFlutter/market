// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i20;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:market/api/auth_service.dart' as _i8;
import 'package:market/api/cart_service.dart' as _i9;
import 'package:market/api/product_service.dart' as _i10;
import 'package:market/api/user_service.dart' as _i7;
import 'package:market/injection/api_module.dart' as _i19;
import 'package:market/injection/di_app_module.dart' as _i25;
import 'package:market/injection/preferences_module.dart' as _i26;
import 'package:market/injection/secure_storage_module.dart' as _i24;
import 'package:market/model/product.dart' as _i23;
import 'package:market/repo/auth_repo.dart' as _i12;
import 'package:market/repo/cart_repo.dart' as _i13;
import 'package:market/repo/product_repo.dart' as _i16;
import 'package:market/repo/user_info_repo.dart' as _i11;
import 'package:market/viewmodel/cart_view_model.dart' as _i14;
import 'package:market/viewmodel/home_view_model.dart' as _i21;
import 'package:market/viewmodel/login_view_model.dart' as _i15;
import 'package:market/viewmodel/product_details_view_model.dart' as _i22;
import 'package:market/viewmodel/products_view_model.dart' as _i17;
import 'package:market/viewmodel/splash_view_model.dart' as _i18;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    final secureStorageModule = _$SecureStorageModule();
    final diAppModule = _$DiAppModule();
    final preferencesModule = _$PreferencesModule();
    gh.lazySingleton<_i3.Dio>(() => apiModule.createDio());
    gh.factory<_i4.FlutterSecureStorage>(
        () => secureStorageModule.createSecureStorage);
    gh.lazySingleton<_i5.GlobalKey<_i5.NavigatorState>>(() => diAppModule.key);
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => preferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<String>(
      () => apiModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<_i7.UserService>(() => _i7.UserService(
          gh<_i3.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i8.AuthService>(() => _i8.AuthService(
          gh<_i3.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i9.CartService>(() => _i9.CartService(
          gh<_i3.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i10.ProductService>(() => _i10.ProductService(
          gh<_i3.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i11.UserRepo>(() => _i11.UserRepo(
          preferences: gh<_i6.SharedPreferences>(),
          userService: gh<_i7.UserService>(),
        ));
    gh.factory<_i12.AuthRepo>(() => _i12.AuthRepo(
          authService: gh<_i8.AuthService>(),
          storage: gh<_i4.FlutterSecureStorage>(),
          preferences: gh<_i6.SharedPreferences>(),
        ));
    gh.factory<_i13.CartRepo>(() => _i13.CartRepo(
          cartService: gh<_i9.CartService>(),
          userService: gh<_i7.UserService>(),
          preferences: gh<_i6.SharedPreferences>(),
        ));
    gh.factory<_i14.CartViewModel>(
        () => _i14.CartViewModel(cartRepo: gh<_i13.CartRepo>()));
    gh.factory<_i15.LoginViewModel>(
        () => _i15.LoginViewModel(gh<_i12.AuthRepo>()));
    gh.factory<_i16.ProductRepo>(
        () => _i16.ProductRepo(productService: gh<_i10.ProductService>()));
    gh.factory<_i17.ProductsViewModel>(() => _i17.ProductsViewModel(
          productRepo: gh<_i16.ProductRepo>(),
          cartRepo: gh<_i13.CartRepo>(),
        ));
    gh.factory<_i18.SplashViewModel>(
        () => _i18.SplashViewModel(authRepo: gh<_i12.AuthRepo>()));
    gh.factory<_i19.TokenInterceptor>(() => _i19.TokenInterceptor(
          key: gh<_i20.GlobalKey<_i20.NavigatorState>>(),
          authRepo: gh<_i12.AuthRepo>(),
        ));
    gh.factory<_i21.HomeViewModel>(() => _i21.HomeViewModel(
          gh<_i16.ProductRepo>(),
          authRepo: gh<_i12.AuthRepo>(),
          cartRepo: gh<_i13.CartRepo>(),
          userRepo: gh<_i11.UserRepo>(),
        ));
    gh.factoryParam<_i22.ProductDetailsViewModel, _i23.Product?, dynamic>((
      product,
      _,
    ) =>
        _i22.ProductDetailsViewModel(
          product: product,
          cartRepo: gh<_i13.CartRepo>(),
          productRepo: gh<_i16.ProductRepo>(),
        ));
    return this;
  }
}

class _$ApiModule extends _i19.ApiModule {}

class _$SecureStorageModule extends _i24.SecureStorageModule {}

class _$DiAppModule extends _i25.DiAppModule {}

class _$PreferencesModule extends _i26.PreferencesModule {}
