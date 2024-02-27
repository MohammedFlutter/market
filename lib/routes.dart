//
// final routes = {
//   '/': (context)
//
// };

import 'package:flutter/material.dart';
import 'package:market/injection/di_init.dart';
import 'package:market/model/product.dart';
import 'package:market/repo/cart_repo.dart';
import 'package:market/repo/product_repo.dart';
import 'package:market/view/screens/cart_screen.dart';
import 'package:market/view/screens/home_screen.dart';
import 'package:market/view/screens/login_screen.dart';
import 'package:market/view/screens/product_details_screen.dart';
import 'package:market/view/screens/products_screen.dart';
import 'package:market/view/screens/splash_screen.dart';
import 'package:market/viewmodel/product_details_view_model.dart';
import 'package:provider/provider.dart';

class MyRouter {
  static const splashRoute = '/';
  static const homeRoute = '/home';
  static const loginRoute = '/login';
  static const productsRoute = '/products';
  static const cartRoute = '/cart';
  static const productDetailsRoute = '/productDetails';

  //
  // final Map<String, WidgetBuilder> routes = {
  //   splashRoute: (context) => const SplashScreen(),
  //   homeRoute: (context) => const HomeScreen(),
  //   loginRoute: (context) => const LoginScreen(),
  //   productDetailsRoute: (context) => const ProductDetailScreen(product: arg),
  //   cartRoute: (context) => const CartScreen(),
  //   productsRoute: (context) => const ProductsScreen(category: arg),
  // };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case productDetailsRoute:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => ProductDetailsViewModel(
                    product: settings.arguments as Product,
                    cartRepo: getIt<CartRepo>(),
                    productRepo: getIt<ProductRepo>(),
                  ),
                  child: ProductDetailScreen(
                      product: settings.arguments as Product),
                ));
      case cartRoute:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case productsRoute:
        return MaterialPageRoute(
            builder: (context) =>
                ProductsScreen(category: settings.arguments as String?));
      // default:
      //   return MaterialPageRoute(builder: (context) => const DefaultScreen()
      //
      //   );
    }
    return null;
  }
}
