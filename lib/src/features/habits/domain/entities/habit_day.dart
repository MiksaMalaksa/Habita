
import 'habit.dart';

class HabitDay {
  final int weekday;
  final List<Habit> habits;

  const HabitDay({
    required this.weekday,
    required this.habits,
  });
}
