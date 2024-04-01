import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/common/entities/user.dart';

abstract interface class IAuthRepo {
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
}
