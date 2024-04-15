import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';

class HabitModel extends Habit {
  const HabitModel({
    required super.id,
    required super.color,
    required super.icon,
    required super.habitType,
    required super.name,
    required super.description,
    required super.isCompleted,
    required super.highestStreak,
    required super.currentStreak,
    super.waterTarget,
    super.waterConsumed,
    super.stepsTarget,
    super.stepsProduced,
    super.taskSteps,
    super.completedSteps,
    super.taskStart,
    super.taskEnd,
    super.timerSeconds,
  });

  HabitModel copyWith(
    String? id,
    Color? color,
    IconData? icon,
    HabitType? habitType,
    String? name,
    String? description,
    bool? isCompleted,
    int? highestStreak,
    int? currentStreak,
    double? waterTarget,
    double? waterConsumed,
    int? stepsTarget,
    int? stepsProduced,
    int? taskSteps,
    int? completedSteps,
    int? timerSeconds,
    String? taskStart,
    String? taskEnd,
  ) {
    return HabitModel(
      id: id ?? this.id,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      habitType: habitType ?? this.habitType,
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      highestStreak: highestStreak ?? this.highestStreak,
      currentStreak: currentStreak ?? this.currentStreak,
      waterTarget: waterTarget ?? this.waterTarget,
      waterConsumed: waterConsumed ?? this.waterConsumed,
      stepsTarget: stepsTarget ?? this.stepsTarget,
      stepsProduced: stepsProduced ?? this.stepsProduced,
      taskSteps: taskSteps ?? this.taskSteps,
      completedSteps: completedSteps ?? this.completedSteps,
      taskStart: taskStart ?? this.taskStart,
      taskEnd: taskEnd ?? this.taskEnd,
      timerSeconds: timerSeconds ?? this.timerSeconds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color.value,
      'icon': icon.codePoint,
      'habitType': habitType.toShortString(),
      'name': name,
      'description': description,
      'isCompleted': isCompleted,
      'highestStreak': highestStreak,
      'currentStreak': currentStreak,
      'waterTarget': waterTarget,
      'waterConsumed': waterConsumed,
      'stepsTarget': stepsTarget,
      'stepsProduced': stepsProduced,
      'taskSteps': taskSteps,
      'completedSteps': completedSteps,
      'taskStart': taskStart,
      'taskEnd': taskEnd,
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'] as String,
      color: Color(map['color'] as int),
      icon: IconData((map['icon'] as IconData).codePoint,
          fontFamily: 'MaterialIcons'),
      habitType: toHabitType(map['habitType']),
      name: map['name'] as String,
      description: map['description'] as String,
      isCompleted: map['isCompleted'] as bool,
      highestStreak: map['highestStreak'] as int,
      currentStreak: map['currentStreak'] as int,
      waterTarget:
          map['waterTarget'] != null ? map['waterTarget'] as double : null,
      waterConsumed:
          map['waterConsumed'] != null ? map['waterConsumed'] as double : null,
      stepsTarget:
          map['stepsTarget'] != null ? map['stepsTarget'] as int : null,
      stepsProduced:
          map['stepsProduced'] != null ? map['stepsProduced'] as int : null,
      taskSteps: map['taskSteps'] != null ? map['taskSteps'] as int : null,
      completedSteps:
          map['completedSteps'] != null ? map['completedSteps'] as int : null,
      taskStart: map['taskStart'] != null ? map['taskStart'] as String : null,
      taskEnd: map['taskEnd'] != null ? map['taskEnd'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitModel.fromJson(String source) =>
      HabitModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory HabitModel.fromHabit(Habit habit) => HabitModel(
        id: habit.id,
        color: habit.color,
        icon: habit.icon,
        habitType: habit.habitType,
        name: habit.name,
        description: habit.description,
        isCompleted: habit.isCompleted,
        highestStreak: habit.highestStreak,
        currentStreak: habit.currentStreak,
      );

  @override
  String toString() {
    return 'Habit(id: $id, color: $color, icon: $icon, habitType: $habitType, name: $name, description: $description, isCompleted: $isCompleted, highestStreak: $highestStreak, currentStreak: $currentStreak, waterTarget: $waterTarget, waterConsumed: $waterConsumed, stepsTarget: $stepsTarget, stepsProduced: $stepsProduced, taskSteps: $taskSteps, completedSteps: $completedSteps)';
  }
}
