import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:habita/core/exceptions/exceptions.dart';
import 'package:habita/core/failures/failure.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/src/features/auth/data/data_sources/iauth_datasource.dart';
import 'package:habita/src/features/auth/domain/entities/user.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';

class AuthRepoImpl implements IAuthRepo {
  final IAuthDataSource datasource;

  const AuthRepoImpl(
      {required this.datasource, });

  @override
  Future<Either<Failure, SupaUser>> currentUser() async {
    try {
      final result = await datasource.getCurrentUserData();
      if (result == null) {
        return const Left(ServerFailure(message: 'User is not plugged in!'));
      }
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, SupaUser>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      function: () async => await datasource.signUp(
        email: email,
        password: password,
        name: name,
      ),
    );
  }

  @override
  Future<Either<Failure, SupaUser>> signIn({
    required String email,
    required String password,
  }) async {
    return _getUser(
      function: () async => await datasource.signIn(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> signOut() async {

    try {
      await datasource.signOut();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount({required String email}) async {
    try {
      await datasource.deleteAccount(email: email);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, SupaUser>> getCurrentUser() async {
    return Right(
      await datasource.getCurrentUser(),
    );
  }

  @override
  Future<Either<Failure, SupaUser>> updateUser({
    String? email,
    String? name,
    String? password,
    String? oldPassword,
    String? imagePath,
    File? imageFile,
  }) async {
    try {
      final result = await datasource.updateUser(
        email: email,
        name: name,
        password: password,
        oldPassword: oldPassword,
        imageFile: imageFile,
        imagePath: imagePath,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, SupaUser>> _getUser(
      {required Future<SupaUser> Function() function}) async {
    try {
      final result = await function();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
