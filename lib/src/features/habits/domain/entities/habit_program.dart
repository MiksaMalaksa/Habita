import 'habit_day.dart';

class HabitProgram {
  final List<HabitDay> habits;
  final String name;
  final String description;
  final bool muatable;
  final String programStart;
  final String programEnd;

  const HabitProgram({
    required this.habits,
    required this.name,
    required this.description,
    required this.muatable,
    required this.programStart,
    required this.programEnd,
  });

  HabitProgram copyWith({
    List<HabitDay>? habits,
    String? name,
    String? description,
    bool? muatable,
    String? programStart,
    String? programEnd,
  }) {
    return HabitProgram(
      habits: habits ?? this.habits,
      name: name ?? this.name,
      description: description ?? this.description,
      muatable: muatable ?? this.muatable,
      programStart: programStart ?? this.programStart,
      programEnd: programEnd ?? this.programEnd,
    );
  }
}
