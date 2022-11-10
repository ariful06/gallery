import 'package:dartz/dartz.dart';
import 'package:gallery/common/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}