import 'package:flutter/material.dart';
import 'package:market/injection/di_init.dart';
import 'package:market/routes.dart';
import 'package:market/viewmodel/cart_view_model.dart';
import 'package:market/viewmodel/home_view_model.dart';
import 'package:market/viewmodel/login_view_model.dart';
import 'package:market/viewmodel/products_view_model.dart';
import 'package:market/viewmodel/splash_view_model.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await initDI();

  debugPrint('username kminchelle password 0lelplR');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SplashViewModel>(
          create: (context) => getIt<SplashViewModel> ()),
      ChangeNotifierProvider<HomeViewModel>(
          create: (context) => getIt<HomeViewModel>()),
      ChangeNotifierProvider<LoginViewModel>(
          create: (context) => getIt<LoginViewModel>()),
      ChangeNotifierProvider<CartViewModel>(
          create: (context) => getIt<CartViewModel>()),
      ChangeNotifierProvider<ProductsViewModel>(
        create: (context) => getIt<ProductsViewModel>(),
      ),
      // ChangeNotifierProvider<ProductDetailsViewModel>(create: (context) => getIt<ProductDetailsViewModel>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MyRouter _router = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.pink,
          textTheme: const TextTheme(
            titleSmall: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
            titleMedium: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20,overflow: TextOverflow.ellipsis),
            labelMedium: TextStyle(color: Colors.grey,),
          )),
      navigatorKey: getIt<GlobalKey<NavigatorState>>(),
      onGenerateRoute: _router.onGenerateRoute,
      initialRoute: MyRouter.splashRoute,
      // home: SplashScreen(),
      // routes: _router.routes
    );
  }
}
