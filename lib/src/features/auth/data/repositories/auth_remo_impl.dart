import 'package:dartz/dartz.dart';
import 'package:habita/core/common/entities/user.dart';
import 'package:habita/core/exceptions/exceptions.dart';
import 'package:habita/core/failures/failure.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/network/connection_checker.dart';
import 'package:habita/src/features/auth/data/data_sources/iauth_datasource.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';

class AuthRepoImpl implements IAuthRepo {
  final IAuthDataSource datasource;
  final IConnectionChecker connectionChecker;

  const AuthRepoImpl(
      {required this.datasource, required this.connectionChecker});

  @override
  Future<Either<Failure, SupaUser>> currentUser() async {
    try {
      //*check the internet
      if (!await (connectionChecker.isConnected)) {
        return const Left(ServerFailure(message: 'No connection'));
      }
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
    if (!await (connectionChecker.isConnected)) {
      return const Left(ServerFailure(message: 'No connection'));
    }

    return Right(
      await datasource.signOut(),
    );
  }

  @override
  Future<Either<Failure, SupaUser>> getCurrentUser() async {
    if (!await (connectionChecker.isConnected)) {
      return const Left(ServerFailure(message: 'No connection'));
    }

    return Right(
      await datasource.getCurrentUser(),
    );
  }

  @override
  Future<Either<Failure, SupaUser>> updateUser({
    required String email,
    required String name,
    required String password,
  }) async {
    if (!await (connectionChecker.isConnected)) {
      return const Left(ServerFailure(message: 'No connection'));
    }

    try {
      return Right(
        await datasource.updateUser(
            email: email, name: name, password: password),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, SupaUser>> _getUser(
      {required Future<SupaUser> Function() function}) async {
    try {
      //*check the internet
      if (!await (connectionChecker.isConnected)) {
        return const Left(ServerFailure(message: 'No connection'));
      }
      final result = await function();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
