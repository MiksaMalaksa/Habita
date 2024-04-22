import 'package:flutter/material.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';

abstract interface class IHabitDataSource {
  Future<HabitProgram> getHabitProgram();

  Future<void> createHabitProgram({required HabitProgram program});

  Future<void> deleteHabitProgram();

  Future<void> editHabitProgram({
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
