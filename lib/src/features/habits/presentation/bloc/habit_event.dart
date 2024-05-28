part of 'habit_bloc.dart';

sealed class HabitEvent extends Equatable {
  const HabitEvent();

  @override
  List<Object> get props => [];
}

final class HabitChange extends HabitEvent {
  final String? habitName;
  final String? habitDescription;
  final int? waterTarget;
  final int? stepsTarget;
  final int? taskSteps;
  final String? taskStart;
  final String? taskEnd;
  final String? remainder;
  final String? habitId;
  final String? id;
  final Color? color;
  final IconData? iconData;
  final HabitType? type;
  final bool? dropReminder;

  const HabitChange({
    this.habitName,
    this.id,
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
    this.dropReminder,
  });
}

final class HabitProgramChange extends HabitEvent {
  final String? name;
  final String? description;
  final bool? muatable;
  final String? programStart;
  final String? programEnd;
  final Habit? habit;
  final List<int>? days;
  final bool? fromScratch;
  final List<HabitDay>? habitDays;

  const HabitProgramChange({
    this.habit,
    this.name,
    this.description,
    this.muatable,
    this.programStart,
    this.programEnd,
    this.days,
    this.fromScratch,
    this.habitDays,
  });
}

final class ChangeHabitStats extends HabitEvent {
  final int? habitIndex;
  final int? dayIndex;
  final bool? delete;
  final int? habitId;
  final String? name;
  final String? reminder;
  final String? aim;
  final bool? muatable;
  final String? programEnd;
  final String? programStart;
  final Color? habitColor;
  final IconData? habitIcon;
  final HabitType? habitType;
  final String? habitName;
  final String? habitDescription;
  final bool? isCompletedHabit;
  final int? waterTarget;
  final int? waterConsumed;
  final int? stepsTarget;
  final int? stepsProduced;
  final int? taskSteps;
  final int? completedSteps;

  const ChangeHabitStats({
    this.habitIndex,
    this.dayIndex,
    this.delete,
    this.habitId,
    this.name,
    this.reminder,
    this.aim,
    this.muatable,
    this.programEnd,
    this.programStart,
    this.habitColor,
    this.habitIcon,
    this.habitType,
    this.habitName,
    this.habitDescription,
    this.isCompletedHabit,
    this.waterTarget,
    this.waterConsumed,
    this.stepsTarget,
    this.stepsProduced,
    this.taskSteps,
    this.completedSteps,
  });
}

final class HabitProgramFinishedEditing extends HabitEvent {}

final class GetHabitProgram extends HabitEvent {}

final class DeleteHabitProgram extends HabitEvent {}
