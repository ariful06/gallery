
import 'package:flutter/material.dart';
import 'package:gallery/api/base_urls.dart';
import 'package:gallery/approute/app_routes.dart';
import 'package:gallery/core/app.dart';
import 'package:gallery/core/env.dart';

void main() => Production( App());

class Production extends Env {
  final String appName = "Gallery";
  final String baseUrl = BaseUrls.baseProductionURL;
  final Color primarySwatch = Colors.green;
  final Color primaryAccent = Colors.green.shade700;
  EnvType environmentType = EnvType.STAGING;

  Production(App app) : super(app){
    AppRoutes.configureRoutes(app.getRouter());
  }

}

