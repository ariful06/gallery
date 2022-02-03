
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:gallery/core/env.dart';
import 'package:gallery/exception/HttpException.dart';

import 'base_urls.dart';

class ApiClient {
  Dio? _dio;

  ApiClient() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = Env.value?.baseUrl ?? BaseUrls.baseDevURL;
    dioOptions.connectTimeout = 10000;
    dioOptions.receiveTimeout = 10000;
    _dio = Dio(dioOptions);
    (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

  }

  var headers = {
    'Content-Type': 'application/json'
  };

  Future<Response?> getFutureResponse(String url) async {
    Response? response = await _dio?.get(url);
    throwIfNoSuccess(response);
    return response;
  }


  void throwIfNoSuccess(Response? response) {
    if ( response?.statusCode != 200) {
      throw HttpException(response!);
    }
  }
}
