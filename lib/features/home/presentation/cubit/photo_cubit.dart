import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/features/home/domain/usercase/fetch_photo_use_case.dart';
import 'package:gallery/features/home/presentation/cubit/photo_state.dart';
import 'package:gallery/logger/Log.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit({required this.fetchPhotoUseCase}) : super(PhotoInitialState());
  final FetchPhotoUseCase fetchPhotoUseCase;

  Future<void> fetchPost(int page, int limit) async {
      emit(PhotoInitialState());
      var result = await fetchPhotoUseCase(Params(page: page, pageLimit: limit));
      result.fold((l) => emit(PhotoErrorState(message: "Error while fetching Posts")),
          (right) => emit(PhotosLoadedState(photos: right, currentPage: page)));
      Log.d(result.toString());
  }
}
