
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gallery/api/api_client.dart';
import 'package:gallery/core/app_provider.dart';
import 'package:gallery/data/photo_repository.dart';
import 'package:gallery/gallery_page.dart';
import 'package:gallery/home/details/details_page.dart';
import 'package:gallery/home/home_page.dart';
import 'package:gallery/service/photo_service.dart';
import 'package:gallery/utils/page_constant.dart';


PhotoService? _photoService;
ApiClient? _apiClient;
PhotoRepository? repository;


void _init(BuildContext context) {
  _apiClient = AppProvider?.getApplication(context)?.getApiClient();
  _photoService = PhotoService(_apiClient);
  repository = PhotoRepository(photoService: _photoService);
}
class AppRoutes {

  static Handler homeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    if(context != null ){
      _init(context);
      return GalleryApp(photoService: _photoService,);
    }
  }
  );  static Handler detailsHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    if(context != null ){
      _init(context);
      return DetailsPage(details:  params[photoDetails]?.first,);
    }
  }
  );

  static void configureRoutes(FluroRouter router) {
    router.define(HomePage.PATH, handler: homeHandler);
    router.define(DetailsPage.PATH, handler: detailsHandler);
  }
}