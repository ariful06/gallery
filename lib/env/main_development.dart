
import 'package:flutter/material.dart';
import 'package:gallery/api/base_urls.dart';
import 'package:gallery/approute/app_routes.dart';
import 'package:gallery/core/app.dart';
import 'package:gallery/core/env.dart';

Future<void> main() async {
  Development(App());
}

class Development extends Env {
  final String appName = "Gallery (Dev)";
  final String baseUrl = BaseUrls.baseDevURL;
  final Color primarySwatch = Colors.cyan;
  final Color primaryAccent = Colors.cyanAccent;
  EnvType environmentType = EnvType.DEVELOPMENT;

  Development(App app) : super(app) {
    AppRoutes.configureRoutes(app.getRouter());
  }
}
