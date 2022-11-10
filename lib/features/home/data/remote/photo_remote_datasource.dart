

import 'package:dio/dio.dart';
import 'package:gallery/api/all_url.dart';
import 'package:gallery/api/api_client.dart';

abstract class  PhotoRemoteDataSource {
  Future<Response> getDate(int page, int limit);
}

class PhotoRemoteDataSourceImpl extends PhotoRemoteDataSource {
  final ApiClient apiClient;
  PhotoRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<Response> getDate(int page, int limit) async {
    var response = await apiClient.getFutureResponse(AllUrl.getPhotosUrlByPageAndLimit(page, limit));
    if (response != null && response.statusCode == 200) {
      return response;
    }else {
      throw DioError(requestOptions: RequestOptions(path: AllUrl.getPhotosUrlByPageAndLimit(page, limit)));
    }
  }
}
