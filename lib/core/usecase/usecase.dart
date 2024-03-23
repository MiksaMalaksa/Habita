import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';

abstract interface class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
