import 'package:dartz/dartz.dart';
import 'package:habita/core/constants/exceptions_messages.dart';
import 'package:habita/core/failures/failure.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/src/features/habits/data/datasources/local/ihabit_local_datasource.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/repositories/habit_repo.dart';

class HabitRepoImpl implements IHabitRepo {
  final IHabitDataSource habitDataSource;

  const HabitRepoImpl({required this.habitDataSource});

  @override
  Future<Either<Failure, void>> deleteHabitProgram() async {
    try {
      await habitDataSource.deleteHabitProgram();
      return const Right(null);
    } catch (_) {
      return const Left(ServerFailure(message: serverFailMsg));
    }
  }

  @override
  Future<Either<Failure, void>> editHabitProgram({
    required HabitProgram program,
  }) async {
    try {
      await habitDataSource.editHabitProgram(
        program: program,
      );
      return const Right(null);
    } catch (_) {
      return const Left(ServerFailure(message: serverFailMsg));
    }
  }

  @override
  Future<Either<Failure, HabitProgram>> getHabitProgram() async {
    try {
      final program = await habitDataSource.getHabitProgram();
      return Right(program);
    } catch (_) {
      return const Left(ServerFailure(message: serverFailMsg));
    }
  }
}
