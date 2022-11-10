import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/common/failure.dart';
import 'package:gallery/common/use_case.dart';
import 'package:gallery/features/home/domain/entity/photo.dart';
import 'package:gallery/features/home/domain/repository/photo_repository.dart';


class FetchPhotoUseCase extends UseCase<List<Photo>, Params> {

  FetchPhotoUseCase(this.repository);
  final PhotoRepository repository;

  @override
  Future<Either<Failure, List<Photo>>> call(Params params) {
    return repository.getDate(params.page, params.pageLimit);
  }
}

class Params extends Equatable {
  final int page;
  final int pageLimit;

  Params({required this.page, required this.pageLimit});

  @override
  List<Object?> get props => [page, pageLimit];
}
