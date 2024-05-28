import 'package:dartz/dartz.dart';
import 'package:habita/core/constants/exceptions_messages.dart';
import 'package:habita/core/failures/failure.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/src/features/habits/data/datasources/remote/ihabit_remote_datasource.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/repositories/remote_repo.dart';

class RemoteHabitRepoImpl implements IRemoteHabitRepo {
  final IRemoteHabitDataSource dataSource;

  const RemoteHabitRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> deleteHabit({required String habitId}) async {
    try {
      await dataSource.deleteHabit(habitId: habitId);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure(message: serverFailMsg));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHabitProgram(
      {required String programId}) async {
    try {
      await dataSource.deleteHabitProgram(programId: programId);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure(message: serverFailMsg));
    }
  }

  @override
  Future<Either<Failure, void>> editHabit({
    required String id,
    required Habit habit,
    String? programId,
    String? habitId,
    int? color,
    int? icon,
    String? habitType,
    String? name,
    bool? isCompleted,
    int? highestStreak,
    int? currentStreak,
    String? description,
    int? waterTarget,
    int? waterConsumed,
    int? stepsTarget,
    int? stepsProduced,
    int? completedSteps,
    int? taskSteps,
    String? remainder,
  }) async {
    try {
      await dataSource.editHabit(
        id: id,
        habit: habit,
        color: color,
        completedSteps: completedSteps,
        currentStreak: currentStreak,
        description: description,
        habitId: habitId,
        habitType: habitType,
        highestStreak: highestStreak,
        icon: icon,
        isCompleted: isCompleted,
        name: name,
        programId: programId,
        remainder: remainder,
        stepsProduced: stepsProduced,
        stepsTarget: stepsTarget,
        taskSteps: taskSteps,
        waterConsumed: waterConsumed,
        waterTarget: waterTarget,
      );
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure(message: serverFailMsg));
    }
  }

  @override
  Future<Either<Failure, void>> editHabitProgram(
      {required String programId,
      required HabitProgram program,
      String? name,
      String? description,
      String? mutability,
      String? endDate,
      String? startDate}) async {
    try {
      await dataSource.editHabitProgram(programId: programId, program: program);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure(message: serverFailMsg));
    }
  }

  @override
  Future<Either<Failure, HabitProgram>> getHabitProgram(
      {required String programId}) async {
    try {
      final result = await dataSource.getHabitProgram(programId: programId);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure(message: serverFailMsg));
    }
  }
}
