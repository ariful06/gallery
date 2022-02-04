import 'package:dio/dio.dart';

import 'Log.dart';


class DioLogger {
  static void onSend(RequestOptions options) {
    Log.d('Request Path: [${options.method}] ${options.baseUrl}${options.path}'
        '\nRequest Data: ${options.data.toString()}');
  }

  static void onSuccess(Response response) {
    Log.d(
        'Response Path: [${response.requestOptions.method}] ${response..requestOptions}${response.requestOptions.path}'
        '\nRequest Data: ${response.requestOptions.data.toString()}'
        '\nResponse statusCode:  ${response.statusCode}'
        '\nResponse data: ${response.data.toString()}');
  }

  static void onError(DioError error) {
    String msg = '';
    if (null != error.response) {
      msg =
          'Error Path: [${error.response?.requestOptions.method}] ${error.response?.requestOptions.baseUrl}${error.response?.requestOptions.path}'
          '\nRequest Data: ${error.response?.requestOptions.data.toString()}'
          '\nError statusCode: ${error.response?.statusCode}'
          '\nError data : ${null != error.response?.data ? error.response?.data.toString() : ''}';
    }
    msg += 'Error Message: ${error.message}';
    Log.e(msg);
  }
}
