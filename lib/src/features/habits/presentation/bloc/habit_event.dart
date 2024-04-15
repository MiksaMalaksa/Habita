part of 'habit_bloc.dart';

sealed class HabitEvent extends Equatable {
  const HabitEvent();

  @override
  List<Object> get props => [];
}

final class HabitProgramChanging extends HabitEvent {
  final List<HabitDay>? habits;
  final String? name;
  final String? description;
  final bool? muatable;
  final String? programStart;
  final String? programEnd;

  const HabitProgramChanging({
    this.habits,
    this.name,
    this.description,
    this.muatable,
    this.programStart,
    this.programEnd,
  });
}
