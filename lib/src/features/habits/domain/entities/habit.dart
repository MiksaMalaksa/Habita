import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:habita/core/enums/habit_type.dart';

class Habit extends Equatable {
  final String id;
  final Color color;
  final IconData icon;
  final HabitType habitType;
  final String name;

  final bool isCompleted;
  final int highestStreak;
  final int currentStreak;
  final String? description;
  final int? waterTarget;
  final int? waterConsumed;
  final int? stepsTarget;
  final int? stepsProduced;
  final int? completedSteps;
  final int? taskSteps;
  final String? remainder;

  const Habit({
    required this.id,
    required this.color,
    required this.icon,
    required this.habitType,
    required this.name,
    required this.isCompleted,
    required this.highestStreak,
    required this.currentStreak,
    this.description,
    this.waterTarget,
    this.waterConsumed,
    this.stepsTarget,
    this.stepsProduced,
    this.taskSteps,
    this.completedSteps,
    this.remainder,
  });

  factory Habit.base({required String id}) => Habit(
        id: id,
        color: const Color.fromARGB(255, 138, 224, 140),
        icon: FontAwesome5.laptop,
        habitType: HabitType.todo,
        name: '',
        description: '',
        isCompleted: false,
        highestStreak: 0,
        currentStreak: 0,
      );

  factory Habit.emptyCopy({required Habit habit}) => Habit(
        id: habit.id,
        color: habit.color,
        icon: habit.icon,
        habitType: habit.habitType,
        name: habit.name,
        description: habit.description,
        isCompleted: false,
        highestStreak: 0,
        currentStreak: 0,
        completedSteps: habit.completedSteps == null ? null : 0,
        remainder: habit.remainder,
        stepsProduced: habit.stepsProduced == null ? null : 0,
        stepsTarget: habit.stepsTarget,
        taskSteps: habit.taskSteps,
        waterConsumed: habit.waterConsumed == null ? null : 0,
        waterTarget: habit.waterTarget,
      );

  factory Habit.sameEmpty(Habit habit) {
    return Habit(
      id: habit.id,
      color: habit.color,
      icon: habit.icon,
      habitType: habit.habitType,
      name: habit.name,
      description: habit.description,
      isCompleted: false,
      highestStreak: 0,
      currentStreak: 0,
    );
  }

  Habit copyWith({
    String? id,
    Color? color,
    IconData? icon,
    HabitType? habitType,
    String? name,
    bool? isCompleted,
    int? highestStreak,
    int? currentStreak,
    String? description,
    int? waterTarget,
    int? waterConsumed,
    int? stepsTarget,
    int? stepsProduced,
    int? taskSteps,
    int? completedSteps,
    String? remainder,
  }) {
    return Habit(
      id: id ?? this.id,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      habitType: habitType ?? this.habitType,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      highestStreak: highestStreak ?? this.highestStreak,
      currentStreak: currentStreak ?? this.currentStreak,
      description: description ?? this.description,
      waterTarget: waterTarget ?? this.waterTarget,
      waterConsumed: waterConsumed ?? this.waterConsumed,
      stepsTarget: stepsTarget ?? this.stepsTarget,
      stepsProduced: stepsProduced ?? this.stepsProduced,
      taskSteps: taskSteps ?? this.taskSteps,
      completedSteps: completedSteps ?? this.completedSteps,
      remainder: remainder ?? this.remainder,
    );
  }

  Habit nullCopy({
    String? description,
    int? waterTarget,
    int? stepsTarget,
    int? taskSteps,
    String? remainder,
  }) {
    return Habit(
      id: id,
      color: color,
      icon: icon,
      habitType: habitType,
      name: name,
      isCompleted: isCompleted,
      highestStreak: highestStreak,
      currentStreak: currentStreak,
      waterConsumed: waterConsumed,
      stepsProduced: stepsProduced,
      taskSteps: taskSteps,
      completedSteps: completedSteps,
      remainder: remainder == '' ? null : this.remainder,
      stepsTarget: stepsTarget == -1 ? null : this.stepsTarget,
      description: description == '' ? null : this.description,
      waterTarget: waterTarget == -1 ? null : this.waterTarget,
    );
  }

  @override
  List<Object?> get props => [
        id,
        color,
        icon,
        habitType,
        name,
        isCompleted,
        highestStreak,
        currentStreak,
        description,
        waterTarget,
        waterConsumed,
        stepsTarget,
        stepsProduced,
        completedSteps,
        taskSteps,
        remainder,
      ];
}
