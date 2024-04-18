part of 'habit_bloc.dart';

//!loaded demand day
sealed class HabitState extends Equatable {
  const HabitState();

  @override
  List<Object> get props => [];
}

final class HabitInitial extends HabitState {}

final class HabitChanging extends HabitState {
  final Habit changeableHabit;

  const HabitChanging({required this.changeableHabit});
}

final class ProgramChanging extends HabitState {
  final HabitProgram changeableProgram;

  const ProgramChanging({required this.changeableProgram});

  @override
  List<Object> get props {
    return [
      changeableProgram.programStart,
      changeableProgram.programEnd,
      changeableProgram.muatable,
      changeableProgram.name,
      changeableProgram.description,
      changeableProgram.habits
          .map((days) => days.habits.map(
                (habit) => habit.icon,
              ))
          .toList(),
      changeableProgram.habits
          .map((days) => days.habits.map(
                (habit) => habit.color,
              ))
          .toList(),
    ];
  }
}
