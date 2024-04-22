part of 'habit_bloc.dart';

//!loaded demand day
sealed class HabitState extends Equatable {
  final HabitProgram program;
  const HabitState({required this.program});

  @override
  List<Object?> get props => [];
}

final class HabitInitial extends HabitState {
  const HabitInitial({required super.program});
}

final class HabitChanging extends HabitState {
  final Habit changeableHabit;

  const HabitChanging({
    required this.changeableHabit,
    required super.program,
  });

  @override
  List<Object?> get props => [
        changeableHabit.color,
        changeableHabit.name,
        changeableHabit.icon,
        changeableHabit.remainder,
        changeableHabit.name,
        changeableHabit.habitType,
      ];
}

final class ProgramChanging extends HabitState {
  const ProgramChanging({required super.program});

  @override
  List<Object> get props {
    return [
      program.programStart,
      program.programEnd,
      program.muatable,
      program.name,
      program.description,
      program.habitDays
          .map((days) => days.habits.map(
                (habit) => habit.icon,
              ))
          .toList(),
      program.habitDays
          .map((days) => days.habits.map(
                (habit) => habit.color,
              ))
          .toList(),
      program.habitDays
          .map((days) => days.habits.map(
                (habit) => habit.description,
              ))
          .toList(),
      program.habitDays
          .map((days) => days.habits.map(
                (habit) => habit.name,
              ))
          .toList(),
      program.habitDays
          .map((days) => days.habits.map(
                (habit) => habit.remainder,
              ))
          .toList(),
      program.habitDays
          .map((days) => days.habits.map(
                (habit) => habit.waterTarget,
              ))
          .toList(),
      program.habitDays
          .map((days) => days.habits.map(
                (habit) => habit.habitType,
              ))
          .toList(),
    ];
  }
}

final class Error extends HabitState {
  final String message;

  const Error({required this.message, required super.program});
}
