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
  Future<Either<Failure, User>> currentUser() async {
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
  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
        function: () async => await datasource.signUp(
            email: email, password: password, name: name));
  }

  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    return _getUser(
        function: () async => await datasource.signIn(
              email: email,
              password: password,
            ));
  }

  Future<Either<Failure, User>> _getUser(
      {required Future<User> Function() function}) async {
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
