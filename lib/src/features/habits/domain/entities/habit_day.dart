import 'package:equatable/equatable.dart';

import 'habit.dart';

class HabitDay extends Equatable {
  final int weekday;
  final String id;
  final List<Habit> habits;

  const HabitDay({
    required this.weekday,
    required this.id,
    required this.habits,
  });

  factory HabitDay.sameInfoEmpty(HabitDay day) => HabitDay(
        weekday: day.weekday,
        id: day.id,
        habits: day.habits.map((habit) => Habit.sameEmpty(habit)).toList(),
      );
      

  @override
  List<Object?> get props => [
        weekday,
        habits,
      ];

}
