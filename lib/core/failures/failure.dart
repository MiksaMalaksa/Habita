import 'package:habita/core/exceptions/exceptions.dart';
import 'package:habita/core/failures/ifailure.dart';

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message: message);

  factory ServerFailure.fromException(ServerException exception) {
    return ServerFailure(message: exception.message);
  }

  @override
  List<String> get props => [message];
}
