import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:gallery/core/app.dart';



class AppProvider extends InheritedWidget {
  final App? application;

  AppProvider({Key? key, required Widget child, this.application}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AppProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppProvider>();
  }

  static FluroRouter? getRouter(BuildContext context) {
    return getApplication(context)?.router;
  }

  static App? getApplication(BuildContext context) {
    return of(context)?.application;
  }

}
