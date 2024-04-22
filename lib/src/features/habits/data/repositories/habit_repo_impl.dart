import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/failures/failure.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/src/features/habits/data/datasources/ihabit_datasource.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/repositories/habit_repo.dart';

class HabitRepoImpl implements IHabitRepo {
  final IHabitDataSource habitDataSource;

  const HabitRepoImpl({required this.habitDataSource});

  @override
  Future<Either<Failure, void>> createHabitProgram(
      {required HabitProgram program}) async {
    try {
      await habitDataSource.createHabitProgram(program: program);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHabitProgram() async {
    try {
      await habitDataSource.deleteHabitProgram();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editHabitProgram({
    int? weekday,
    String? name,
    String? reminder,
    String? aim,
    bool? muatable,
    String? programEnd,
    String? programStart,
    Color? habitColor,
    IconData? habitIcon,
    HabitType? habitType,
    String? habitName,
    String? habitDescription,
    bool? isCompletedHabit,
    double? waterTarget,
    double? waterConsumed,
    int? stepsTarget,
    int? stepsProduced,
    int? taskSteps,
    int? completedSteps,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, HabitProgram>> getHabitProgram() async {
    try {
      final program = await habitDataSource.getHabitProgram();
      return Right(program);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
