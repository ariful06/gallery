import 'package:fluro/fluro.dart';
import 'package:gallery/api/api_client.dart';
import 'package:gallery/logger/Log.dart';
import 'package:logger/logger.dart';

import 'application.dart';

class App implements Application {
  FluroRouter? router;
  ApiClient? _apiClient;
  

  @override
  Future<void> onCreate() async {
    _initLog();
    _initRouter();
    _initAPIClient();
  }

  @override
  Future<void> onTerminate() async {
  }

  void _initLog() {
    Log.init();
    Log.setLevel(Level.verbose);
  }

  void _initRouter() {
    router = FluroRouter();
  }



  FluroRouter getRouter() {
    router ??= FluroRouter();
    return router!;
  }


  void _initAPIClient() {
    _apiClient = ApiClient();
  }

  ApiClient getApiClient() {
    if (_apiClient == null) _initAPIClient();
    return _apiClient!;
  }


}
