
import 'package:flutter/material.dart';
import 'package:gallery/api/base_urls.dart';
import 'package:gallery/approute/app_routes.dart';
import 'package:gallery/core/app.dart';
import 'package:gallery/core/env.dart';

void main() => Staging(App());


class Staging extends Env {
  final String appName = "Gallery (Stage)";
  final String baseUrl = BaseUrls.baseStageURL;
  final Color primarySwatch = Colors.teal;
  final Color primaryAccent = Colors.teal.shade700;
  EnvType environmentType = EnvType.STAGING;

  Staging(App app):super(app){
    AppRoutes.configureRoutes(app.getRouter());
  }

}

