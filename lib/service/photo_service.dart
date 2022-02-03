

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gallery/api/all_url.dart';
import 'package:gallery/api/api_client.dart';
import 'package:gallery/common/base_service.dart';
import 'package:gallery/data/model/photos_dto.dart';
import 'package:gallery/logger/Log.dart';

class PhotoService extends BaseService{

  PhotoService(ApiClient? apiClient) : super(apiClient);

  Future<List<ImageDTO>> fetchPhotos(int page, int limit) async{
    List<ImageDTO> photos = [];
    try{
      Response? response = await getApiClient()?.getFutureResponse(AllUrl.getPhotosUrlByPageAndLimit(page, limit));
      List<ImageDTO> prescriptionList = List<ImageDTO>.from(response?.data.map((data) => ImageDTO.fromJson(data)));
      return prescriptionList;
    }catch(e){
      Log.e(e.toString());
    }
    return photos;
  }
}