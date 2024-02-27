import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DiAppModule {
  @lazySingleton
  GlobalKey<NavigatorState> get key => GlobalKey<NavigatorState>();
}
