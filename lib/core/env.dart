
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gallery/core/app.dart';
import 'package:gallery/core/app_component.dart';

enum EnvType { DEVELOPMENT, STAGING, PRODUCTION }

class Env {
  static Env? value;
  String? appName;
  String? baseUrl;
  EnvType environmentType = EnvType.DEVELOPMENT;
  App? application;

  Env(App app) {
    application = app;
    value = this;
    _init();
  }

  _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await application?.onCreate();
    runApp(AppComponent(application!));
  }
}
