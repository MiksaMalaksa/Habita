import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:habita/core/common/widgets/date_picker_configes.dart';
import 'package:habita/core/enums/habit_type.dart';

import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_day.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:intl/intl.dart';

part 'habit_event.dart';
part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  HabitBloc() : super(HabitInitial()) {
    on<HabitProgramChange>(_programChangedHandler);
    on<HabitChange>(_habitChangeHandler);
  }

  void _habitChangeHandler(HabitChange event, Emitter<HabitState> emit) {
    final currentState = state;
    late Habit currChangeableHabit;

    if (currentState is HabitChanging) {
      if (event.habitId != null ||
          event.habitId != currentState.changeableHabit.id) {
        currChangeableHabit = Habit.base(id: event.habitId!);
      } else {
        currChangeableHabit = currentState.changeableHabit;
      }
    }

    currChangeableHabit = currChangeableHabit.copyWith(
      color: event.color,
      description: event.habitDescription,
      habitType: event.type,
      icon: event.iconData,
      name: event.habitName,
      remainder: event.remainder,
      stepsTarget: event.stepsTarget,
      taskStart: event.taskStart,
      taskEnd: event.taskEnd,
      waterTarget: event.waterTarget,
      taskSteps: event.stepsTarget,
    );

    emit(HabitChanging(changeableHabit: currChangeableHabit));
  }

  //!Case when we edit, but not submit changes
  void _programChangedHandler(
    HabitProgramChange event,
    Emitter<HabitState> emit,
  ) {
    final currentState = state;
    late HabitProgram currChangeableProgram;

    if (currentState is ProgramChanging) {
      currChangeableProgram = currentState.changeableProgram;
    } else {
      final weekdays = [1, 2, 3, 4, 5, 6, 7];
      currChangeableProgram = HabitProgram(
        habits: List.generate(
          weekdays.length,
          (index) => HabitDay(
            weekday: weekdays[index],
            habits: [],
          ),
        ),
        name: '',
        description: '',
        muatable: false,
        programStart: DateFormat.yMd().format(DateTime.now()),
        programEnd: DateFormat.yMd().format(
            DateTime.now().add(const Duration(days: minProgramDuration))),
      );
    }

    currChangeableProgram = currChangeableProgram.copyWith(
      description: event.description,
      muatable: event.muatable,
      name: event.name,
      programEnd: event.programEnd,
      programStart: event.programStart,
    );

    emit(ProgramChanging(changeableProgram: currChangeableProgram));
  }
}
