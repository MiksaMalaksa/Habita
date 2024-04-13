import 'dart:convert';

import 'package:habita/src/features/habits/data/models/habit_day_model.dart';
import 'package:habita/src/features/habits/domain/entities/habit_day.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:intl/intl.dart';

class HabitProgramModel extends HabitProgram {
  const HabitProgramModel({
    required super.habits,
    required super.name,
    required super.description,
    required super.muatable,
    required super.programStart,
    required super.programEnd,
  });

  HabitProgramModel copyWith({
    List<HabitDay>? habits,
    String? name,
    String? description,
    bool? muatable,
    DateFormat? programStart,
    DateFormat? programEnd,
  }) {
    return HabitProgramModel(
      habits: habits ?? this.habits,
      name: name ?? this.name,
      description: description ?? this.description,
      muatable: muatable ?? this.muatable,
      programStart: programStart ?? this.programStart,
      programEnd: programEnd ?? this.programEnd,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'habits': habits
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
      habits: List<HabitDay>.from(
        (map['habits'] as List<Map<String, dynamic>>)
            .map<HabitDay>((mappedDays) => HabitDayModel.fromMap(map)),
      ),
      name: map['name'] as String,
      description: map['description'] as String,
      muatable: map['muatable'] as bool,
      programStart: map['programStart'] as DateFormat,
      programEnd: map['programEnd'] as DateFormat,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitProgramModel.fromJson(String source) =>
      HabitProgramModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HabitProgram(habits: $habits, name: $name, description: $description, muatable: $muatable)';
  }
}
