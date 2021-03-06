



import 'package:flutter/material.dart';
import 'package:gallery/api/base_urls.dart';
import 'package:gallery/approute/app_routes.dart';
import 'package:gallery/core/app.dart';
import 'package:gallery/core/env.dart';

void main() => Development(App());

class Development extends Env {
  final String appName = "CCR User (D)";
  final String baseUrl = BaseUrls.baseDevURL;
  final Color primarySwatch = Colors.blue;
  final Color primaryAccent = Colors.blueGrey.shade700;
  EnvType environmentType = EnvType.DEVELOPMENT;

  Development(App app) : super(app) {
    AppRoutes.configureRoutes(app.getRouter());
  }
}
