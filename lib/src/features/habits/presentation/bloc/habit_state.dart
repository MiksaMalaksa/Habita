part of 'habit_bloc.dart';

sealed class HabitState extends Equatable {
  final HabitProgram program;
  const HabitState({required this.program});

  @override
  List<Object?> get props => [
        program.programStart,
        program.programEnd,
        program.muatable,
        program.name,
        program.description,
        program.habitDays,
      ];
}

final class HabitInitial extends HabitState {
  const HabitInitial({required super.program});

  @override
  List<Object?> get props => [program];
}

final class HabitLoading extends HabitState {
  const HabitLoading({required super.program});
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
  List<Object?> get props {
    return [
      program.programStart,
      program.programEnd,
      program.muatable,
      program.name,
      program.description,
      program.habitDays,
    ];
  }
}

final class Error extends HabitState {
  final String message;

  const Error({required this.message, required super.program});
}
