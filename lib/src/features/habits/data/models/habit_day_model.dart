import 'dart:convert';

import 'package:habita/src/features/habits/data/models/habit_model.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_day.dart';

class HabitDayModel extends HabitDay {
  const HabitDayModel({
    required super.weekday,
    required super.habits,
  });

  HabitDayModel copyWith({
    int? weekday,
    List<Habit>? habits,
    bool? isCompleted,
    double? successProcentage,
    String? id,
  }) {
    return HabitDayModel(
      weekday: weekday ?? this.weekday,
      habits: habits ?? this.habits,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weekday': weekday,
      'habits':
          habits.map((habit) => HabitModel.fromHabit(habit).toMap()).toList(),
    };
  }

  factory HabitDayModel.fromMap(Map<String, dynamic> map) {
    return HabitDayModel(
      weekday: map['weekday'] as int,
      habits: List<Habit>.from(
        (map['habits'] as List<dynamic>).map(
          (mappedHabit) => HabitModel.fromMap(mappedHabit),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitDayModel.fromJson(String source) =>
      HabitDayModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory HabitDayModel.fromHabitDay(HabitDay day) => HabitDayModel(
        weekday: day.weekday,
        habits: day.habits,
      );

  @override
  String toString() {
    return 'HabitDay(weekday: $weekday, habits: $habits)';
  }
}
