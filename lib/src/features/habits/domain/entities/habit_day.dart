import 'package:intl/intl.dart';

import 'habit.dart';

class HabitDay {
  final DateFormat weekday;
  final List<Habit> habits;
  final bool isCompleted;
  final double successProcentage;
  final String id;

  const HabitDay({
    required this.weekday,
    required this.habits,
    required this.isCompleted,
    required this.successProcentage,
    required this.id,
  });
}
