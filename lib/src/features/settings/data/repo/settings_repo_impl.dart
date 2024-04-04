import 'package:dartz/dartz.dart';
import 'package:habita/core/common/entities/user.dart';
import 'package:habita/core/failures/failure.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/network/connection_checker.dart';
import 'package:habita/src/features/settings/data/datasources/isettings_datasource.dart';
import 'package:habita/src/features/settings/domain/repo/isettings_repo.dart';

class SettingsRepoImpl implements ISettingsRepo {
  final ISettingsDataSource datasource;
  final IConnectionChecker connectionChecker;

  const SettingsRepoImpl(
      {required this.datasource, required this.connectionChecker});

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
}
