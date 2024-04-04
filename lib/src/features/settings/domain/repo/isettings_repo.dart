import 'package:dartz/dartz.dart';
import 'package:habita/core/common/entities/user.dart';
import 'package:habita/core/failures/ifailure.dart';

abstract interface class ISettingsRepo {
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, SupaUser>> updateUser(
      {required String name, required String password, required String email});
  Future<Either<Failure, SupaUser>> getCurrentUser();
}
