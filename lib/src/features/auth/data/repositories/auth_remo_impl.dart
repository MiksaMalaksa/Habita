import 'package:dartz/dartz.dart';
import 'package:habita/core/exceptions/exceptions.dart';
import 'package:habita/core/failures/failure.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/src/features/auth/data/data_sources/iauth_datasource.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';

class AuthRepoImpl implements IAuthRepo {
  final IAuthDataSource datasource;

  const AuthRepoImpl({required this.datasource});

  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result =
          await datasource.signUp(name: name, email: email, password: password);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
          ServerFailure.fromException(ServerException(message: e.message)));
    }
  }
}
