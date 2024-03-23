import 'package:habita/core/exceptions/exceptions.dart';
import 'package:habita/core/failures/ifailure.dart';

class ServerFailure extends Failure {
  final String message;

  ServerFailure.fromException(ServerException exception)
      : message = exception.message;

  ServerFailure({required this.message});

  @override
  List<String> get props => [message];
}
