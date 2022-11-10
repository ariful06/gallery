import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gallery/common/failure.dart';
import 'package:gallery/features/home/data/remote/photo_remote_datasource.dart';
import 'package:gallery/features/home/domain/entity/photo.dart';
import 'package:gallery/features/home/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  PhotoRepositoryImpl({required this.photoRemoteDataSource});

  final PhotoRemoteDataSource photoRemoteDataSource;

  @override
  Future<Either<Failure, List<Photo>>> getDate(int page, int limit) async {
    try {
      final response = await photoRemoteDataSource.getDate(page, limit);
      if (response.statusCode == 200) {
        var result = response.data;
        List<Photo> voteList = List<Photo>.from(result.map((data) => Photo.fromJson(data)));
        return Right(voteList);
      }
    } on DioError catch (error) {
      //TODO check dio exceptions
      Left(ServerFailure("Server error"));
    }
    //TODO check other exceptions
    return Left(ServerFailure("Server error"));
  }
}
