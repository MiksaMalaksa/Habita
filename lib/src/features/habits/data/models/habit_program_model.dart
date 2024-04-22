import 'dart:convert';

import 'package:habita/src/features/habits/data/models/habit_day_model.dart';
import 'package:habita/src/features/habits/domain/entities/habit_day.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';

class HabitProgramModel extends HabitProgram {
  const HabitProgramModel({
    required super.habitDays,
    required super.name,
    required super.description,
    required super.muatable,
    required super.programStart,
    required super.programEnd,
  });

  @override
  HabitProgramModel copyWith({
    List<HabitDay>? habitDays,
    String? name,
    String? description,
    bool? muatable,
    String? programStart,
    String? programEnd,
  }) {
    return HabitProgramModel(
      habitDays: habitDays ?? this.habitDays,
      name: name ?? this.name,
      description: description ?? this.description,
      muatable: muatable ?? this.muatable,
      programStart: programStart ?? this.programStart,
      programEnd: programEnd ?? this.programEnd,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'habits': habitDays
          .map((habitDay) => HabitDayModel.fromHabitDay(habitDay).toMap())
          .toList(),
      'name': name,
      'description': description,
      'muatable': muatable,
      'programStart': programStart,
      'programEnd': programEnd,
    };
  }

  factory HabitProgramModel.fromMap(Map<String, dynamic> map) {
    return HabitProgramModel(
      habitDays: List<HabitDay>.from(
        (map['habits'] as List<dynamic>)
            .map<HabitDay>((mappedDays) => HabitDayModel.fromMap(mappedDays)),
      ),
      name: map['name'] as String,
      description: map['description'] as String,
      muatable: map['muatable'] as bool,
      programStart: map['programStart'] as String,
      programEnd: map['programEnd'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitProgramModel.fromEntity(HabitProgram program) =>
      HabitProgramModel(
          habitDays: program.habitDays,
          name: program.name,
          description: program.description,
          muatable: program.muatable,
          programStart: program.programStart,
          programEnd: program.programEnd);

  factory HabitProgramModel.fromJson(String source) {
    return HabitProgramModel.fromMap(json.decode(source));
  }

  @override
  String toString() {
    return 'HabitProgram(habits: $habitDays, name: $name, description: $description, muatable: $muatable)';
  }
}
