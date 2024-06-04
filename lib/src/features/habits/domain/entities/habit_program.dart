import 'package:equatable/equatable.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:intl/intl.dart';

import 'package:habita/core/common/widgets/date_picker_configes.dart';
import 'package:uuid/uuid.dart';

import 'habit_day.dart';

class HabitProgram extends Equatable {
  final List<HabitDay> habitDays;
  final String name;
  final String id;
  final String description;
  final bool muatable;
  final String programStart;
  final String programEnd;

  const HabitProgram({
    required this.habitDays,
    required this.name,
    required this.description,
    required this.muatable,
    required this.programStart,
    required this.programEnd,
    required this.id,
  });

  int programLength() {
    final dateFormat = DateFormat('M/d/yyyy');
    final startDays = dateFormat.parse(programStart);
    int difference = dateFormat.parse(programEnd).difference(startDays).inDays;
    return difference;
  }

  factory HabitProgram.base() {
    final weekdays = [1, 2, 3, 4, 5, 6, 7];
    return HabitProgram(
      id: const Uuid().v4(),
      habitDays: List.generate(
        weekdays.length,
        (index) => HabitDay(
          id: const Uuid().v4(),
          weekday: weekdays[index],
          // ignore: prefer_const_literals_to_create_immutables
          habits: [],
        ),
      ),
      name: '',
      description: '',
      muatable: false,
      programStart: DateFormat(dateFormat).format(DateTime.now()),
      programEnd: DateFormat(dateFormat)
          .format(DateTime.now().add(const Duration(days: minProgramDuration))),
    );
  }

  HabitProgram copyWith({
    List<HabitDay>? habitDays,
    String? name,
    String? description,
    bool? muatable,
    String? programStart,
    String? programEnd,
  }) {
    return HabitProgram(
      habitDays: habitDays ?? this.habitDays,
      name: name ?? this.name,
      description: description ?? this.description,
      muatable: muatable ?? this.muatable,
      programStart: programStart ?? this.programStart,
      programEnd: programEnd ?? this.programEnd,
      id: id,
    );
  }

  @override
  List<Object?> get props => [
        habitDays,
        name,
        description,
        muatable,
        programStart,
        programEnd,
      ];
}
