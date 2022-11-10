

import 'package:dartz/dartz.dart';
import 'package:gallery/common/failure.dart';
import 'package:gallery/features/home/domain/entity/photo.dart';

abstract class PhotoRepository{
  Future<Either<Failure, List<Photo>>> getDate(int page, int limit);
}