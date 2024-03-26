import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';

abstract interface class IAuthRepo {
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signUp({
    required String name,
    required String email,
    required String password,
  });
}
