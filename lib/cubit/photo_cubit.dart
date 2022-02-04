import 'package:bloc/bloc.dart';
import 'package:gallery/cubit/photo_state.dart';
import 'package:gallery/data/model/photos_dto.dart';
import 'package:gallery/logger/Log.dart';
import 'package:gallery/service/photo_service.dart';


class PhotoCubit extends Cubit<PhotoState> {

  PhotoCubit({this.service}) : super(PhotoInitialState());

  final PhotoService? service;

  Future<List<ImageDTO>?> fetchPost(int page,int limit) async {
    try {

      emit(PhotoInitialState());
      List<ImageDTO>? photos = await service?.fetchPhotos(page, limit);
      Log.d(photos.toString());
      if(photos != null && photos.isNotEmpty){
        emit(PhotosLoadedState(photos: photos,currentPage: page));
      }else {
        emit(PhotoErrorState(message: "Error while fetching Posts"));
      }
    } catch (e) {
      print(e);
      emit(PhotoErrorState(message: e.toString()));
    }
  }
}
