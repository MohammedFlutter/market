import 'package:flutter/material.dart';
import 'package:market/viewmodel/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashViewModel>().checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          "assets/store.png",
          height: 200,
        ),
        const SizedBox(
          height: 50,
        ),
        const CircularProgressIndicator(),
      ]),
    ));
  }
}
