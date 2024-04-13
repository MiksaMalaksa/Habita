import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:intl/intl.dart';

abstract interface class IHabitRepo {
  Future<Either<Failure, HabitProgram>> getHabitProgram();

  Future<Either<Failure, void>> createHabitProgram({HabitProgram program});

  Future<Either<Failure, void>> editHabitProgram({
    String? name,
    String? description,
    bool? muatable,
    DateFormat? programEnd,
  });

  Future<Either<Failure, void>> deleteHabitProgram();

  Future<Either<Failure, void>> editHabitDay({List<Habit>? habits});

  Future<Either<Failure, void>> editHabit({
    Color? color,
    IconData? icon,
    HabitType? habitType,
    String? name,
    String? description,
    bool? isCompleted,
    double? waterTarget,
    double? waterConsumed,
    int? stepsTarget,
    int? stepsProduced,
    int? taskSteps,
    int? completedSteps,
    int? timerSeconds,
  });
}
