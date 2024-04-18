part of 'habit_bloc.dart';

sealed class HabitEvent extends Equatable {
  const HabitEvent();

  @override
  List<Object> get props => [];
}

final class HabitChange extends HabitEvent {
  final String? habitName;
  final String? habitDescription;
  final double? waterTarget;
  final int? stepsTarget;
  final int? taskSteps;
  final String? taskStart;
  final String? taskEnd;
  final String? remainder;
  final String? habitId;
  final Color? color;
  final IconData? iconData;
  final HabitType? type;
  final List<int>? days;

  const HabitChange({
    this.habitName,
    this.habitDescription,
    this.waterTarget,
    this.stepsTarget,
    this.taskSteps,
    this.taskStart,
    this.taskEnd,
    this.remainder,
    this.habitId,
    this.color,
    this.iconData,
    this.type,
    this.days,
  });
}

final class HabitProgramChange extends HabitEvent {
  final String? name;
  final String? description;
  final bool? muatable;
  final String? programStart;
  final String? programEnd;
  final Habit? habit;
  final bool? submitted;

  const HabitProgramChange({
    this.habit,
    this.name,
    this.description,
    this.muatable,
    this.programStart,
    this.programEnd,
    this.submitted,
  });
}
