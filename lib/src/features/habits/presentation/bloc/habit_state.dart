part of 'habit_bloc.dart';

sealed class HabitState extends Equatable {
  const HabitState();

  @override
  List<Object> get props => [];
}

final class HabitInitial extends HabitState {}

final class HabitChanging extends HabitState {
  final HabitProgram changeableProgram;

  const HabitChanging({required this.changeableProgram});

  @override
  List<Object> get props => [
        changeableProgram.programStart,
        changeableProgram.programEnd,
        changeableProgram.muatable,
        changeableProgram.name,
        changeableProgram.description,
      ];
}
