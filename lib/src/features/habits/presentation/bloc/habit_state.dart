part of 'habit_bloc.dart';

sealed class HabitState extends Equatable {
  const HabitState();
  
  @override
  List<Object> get props => [];
}

final class HabitInitial extends HabitState {}
