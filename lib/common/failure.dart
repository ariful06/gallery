import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
}
class ServerFailure extends Failure{
  final String errorMessage;
  ServerFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

}