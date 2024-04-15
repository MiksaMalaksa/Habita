import 'package:flutter/material.dart';
import 'package:habita/core/enums/habit_type.dart';

class Habit {
  final String id;
  final Color color;
  final IconData icon;
  final HabitType habitType;
  final String name;
  final String description;
  final bool isCompleted;
  final int highestStreak;
  final int currentStreak;
  final double? waterTarget;
  final double? waterConsumed;
  final int? stepsTarget;
  final int? stepsProduced;
  final int? taskSteps;
  final int? completedSteps;
  final int? timerSeconds;
  final String? taskStart;
  final String? taskEnd;

  const Habit({
    required this.id,
    required this.color,
    required this.icon,
    required this.habitType,
    required this.name,
    required this.description,
    required this.isCompleted,
    required this.highestStreak,
    required this.currentStreak,
    this.waterTarget,
    this.waterConsumed,
    this.stepsTarget,
    this.stepsProduced,
    this.taskSteps,
    this.completedSteps,
    this.taskEnd,
    this.taskStart,
    this.timerSeconds,
  });
}
