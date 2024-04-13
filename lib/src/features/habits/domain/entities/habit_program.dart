import 'package:intl/intl.dart';

import 'habit_day.dart';

class HabitProgram {
  final List<HabitDay> habits;
  final String name;
  final String description;
  final bool muatable;
  final DateFormat programStart;
  final DateFormat programEnd;

  const HabitProgram({
    required this.habits,
    required this.name,
    required this.description,
    required this.muatable,
    required this.programStart,
    required this.programEnd,
  });
}
