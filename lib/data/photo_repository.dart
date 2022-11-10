

import 'package:gallery/api/all_url.dart';
import 'package:gallery/data/model/photos_dto.dart';
import 'package:gallery/service/photo_service.dart';

// class PhotoRepository {
//
//   final PhotoService? photoService;
//
//   PhotoRepository({this.photoService});
//
//   Future<List<ImageDTO>?> fetchPhotos(int page,int limit) async {
//     final response = await photoService?.getApiClient()?.getFutureResponse(AllUrl.getPhotosUrlByPageAndLimit(page, limit));
//     List<ImageDTO> data = response?.data.map((e)=> ImageDTO.fromJson(response.data)).toList();
//     return [];
//   }
// }
