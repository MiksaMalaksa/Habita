import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';

abstract interface class IHabitRepo {
  Future<Either<Failure, HabitProgram>> getHabitProgram();

  Future<Either<Failure, void>> createHabitProgram(
      {required HabitProgram program});

  Future<Either<Failure, void>> deleteHabitProgram();

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
  });
}
