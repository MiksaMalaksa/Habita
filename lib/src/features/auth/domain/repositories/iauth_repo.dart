import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/common/entities/user.dart';

abstract interface class IAuthRepo {
  Future<Either<Failure, SupaUser>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, SupaUser>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, SupaUser>> currentUser();

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, SupaUser>> updateUser({
    required String name,
    required String password,
    required String email,
  });

  Future<Either<Failure, SupaUser>> getCurrentUser();
}
