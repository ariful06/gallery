

import 'package:gallery/api/all_url.dart';
import 'package:gallery/data/model/photos_dto.dart';
import 'package:gallery/service/photo_service.dart';

class PhotoRepository {

  final PhotoService? photoService;

  PhotoRepository({this.photoService});

  Future<List<Photos>?> fetchPhotos(int page,int limit) async {
    final response = await photoService?.getApiClient()?.getFutureResponse(AllUrl.getPhotosUrlByPageAndLimit(page, limit));
    List<Photos> data = response?.data.map((e)=> Photos.fromJson(response.data)).toList();
    return [];
  }
}
