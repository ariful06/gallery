import 'package:gallery/api/api_client.dart';
import 'package:gallery/features/home/data/remote/photo_remote_datasource.dart';
import 'package:gallery/features/home/data/repository/photo_repository_impl.dart';
import 'package:gallery/features/home/domain/repository/photo_repository.dart';
import 'package:gallery/features/home/domain/usercase/fetch_photo_use_case.dart';
import 'package:gallery/features/home/presentation/cubit/photo_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => PhotoCubit(fetchPhotoUseCase: sl()));
  // Use cases
  sl.registerLazySingleton(() => FetchPhotoUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PhotoRepository>(() => PhotoRepositoryImpl(photoRemoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<PhotoRemoteDataSource>(
    () => PhotoRemoteDataSourceImpl(apiClient: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => ApiClient());
}
