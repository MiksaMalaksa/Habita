import 'dart:convert';

import 'package:habita/src/features/habits/data/models/habit_model.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_day.dart';
import 'package:intl/intl.dart';

class HabitDayModel extends HabitDay {
  const HabitDayModel({
    required super.weekday,
    required super.habits,
    required super.isCompleted,
    required super.successProcentage,
    required super.id,
  });

  HabitDayModel copyWith({
    DateFormat? weekday,
    List<Habit>? habits,
    bool? isCompleted,
    double? successProcentage,
    String? id,
  }) {
    return HabitDayModel(
      weekday: weekday ?? this.weekday,
      habits: habits ?? this.habits,
      isCompleted: isCompleted ?? this.isCompleted,
      successProcentage: successProcentage ?? this.successProcentage,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weekday': weekday,
      'habits':
          habits.map((habit) => HabitModel.fromHabit(habit).toMap()).toList(),
      'isCompleted': isCompleted,
      'successProcentage': successProcentage,
      'id': id,
    };
  }

  factory HabitDayModel.fromMap(Map<String, dynamic> map) {
    return HabitDayModel(
      weekday: map['weekday'] as DateFormat,
      habits: List<Habit>.from(
        (map['habits'] as List<Map<String, dynamic>>).map(
          (mappedHabit) => HabitModel.fromMap(mappedHabit),
        ),
      ),
      isCompleted: map['isCompleted'] as bool,
      successProcentage: map['successProcentage'] as double,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitDayModel.fromJson(String source) =>
      HabitDayModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory HabitDayModel.fromHabitDay(HabitDay day) => HabitDayModel(
        weekday: day.weekday,
        habits: day.habits,
        isCompleted: day.isCompleted,
        successProcentage: day.successProcentage,
        id: day.id,
      );

  @override
  String toString() {
    return 'HabitDay(weekday: $weekday, habits: $habits, isCompleted: $isCompleted, successProcentage: $successProcentage, id: $id)';
  }
}
