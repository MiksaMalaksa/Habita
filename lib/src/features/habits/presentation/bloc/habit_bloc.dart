import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/core/constants/exceptions_messages.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_day.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/usecases/create_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/delete_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/edit_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/get_program_usecase.dart';
import 'package:intl/intl.dart';

part 'habit_event.dart';
part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  //*Usecases
  final GetProgram _getProgram;
  final DeleteProgram _deleteProgram;
  final EditProgram _editProgram;
  final CreateProgram _createProgram;

  HabitBloc(
      {required GetProgram getProgram,
      required DeleteProgram deleteProgram,
      required EditProgram editProgram,
      required CreateProgram createProgram})
      : _getProgram = getProgram,
        _deleteProgram = deleteProgram,
        _editProgram = editProgram,
        _createProgram = createProgram,
        super(HabitInitial(program: HabitProgram.base())) {
    on<HabitProgramChange>(_programChangedHandler);
    on<HabitChange>(_habitChangeHandler);
    on<HabitProgramFinishedEditing>(_finishedHandler);
    on<GetHabitProgram>(_getProgramHandler);
    on<DeleteHabitProgram>(_deleteProgramHandler);
  }

  Future<void> _deleteProgramHandler(
      DeleteHabitProgram event, Emitter<HabitState> emit) async {
    final result = await _deleteProgram(NoParams());
    result.fold(
      (_) => Error(message: serverFailMsg, program: state.program),
      (program) {
        emit(HabitInitial(program: HabitProgram.base()));
      },
    );
  }

  Future<void> _getProgramHandler(
      GetHabitProgram event, Emitter<HabitState> emit) async {
    final result = await _getProgram(NoParams());
    result.fold(
      (_) => Error(message: serverFailMsg, program: state.program),
      (program) {
        emit(HabitInitial(program: program));
      },
    );
  }

  //!Create additional event to highlight habitDay copy logic
  Future<void> _finishedHandler(
      HabitProgramFinishedEditing event, Emitter<HabitState> emit) async {
    final currentProgram = state.program;

    final dateFormatter = DateFormat(dateFormat);
    final startDays = dateFormatter
        .parse(currentProgram.programStart)
        .add(const Duration(days: 7));
    int copyDifference = dateFormatter
        .parse(currentProgram.programEnd)
        .difference(startDays)
        .inDays;

    for (int i = 0; copyDifference > 0; i++) {
      currentProgram.habitDays
          .add(currentProgram.habitDays[i % currentProgram.habitDays.length]);
      copyDifference--;
    }

    final result =
        await _createProgram(CreateProgramParams(program: currentProgram));
    result.fold(
      (_) => Error(message: serverFailMsg, program: currentProgram),
      (_) => ProgramChanging(program: currentProgram),
    );
  }

  void _habitChangeHandler(HabitChange event, Emitter<HabitState> emit) {
    final currentState = state;
    final currentProgram = state.program;
    late Habit currChangeableHabit;

    if (currentState is HabitChanging) {
      if (event.habitId != null &&
          event.habitId != currentState.changeableHabit.id) {
        currChangeableHabit = Habit.base(id: event.habitId!);
      } else {
        currChangeableHabit = currentState.changeableHabit;
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
        if (event.dropReminder == true) {
          currChangeableHabit = currChangeableHabit.nullCopy(remainder: '');
        }
      }
    } else {
      currChangeableHabit = Habit.base(id: event.habitId!);
    }

    emit(
      HabitChanging(
        changeableHabit: currChangeableHabit,
        program: currentProgram,
      ),
    );
  }

  //!Case when we edit, but not submit changes
  void _programChangedHandler(
    HabitProgramChange event,
    Emitter<HabitState> emit,
  ) {
    final currentState = state;
    HabitProgram currChangeableProgram = currentState.program;

    if (event.habit != null && event.days != null) {
      for (var day in event.days!) {
        currChangeableProgram.habitDays[day].habits.add(event.habit!);
      }
    }

    currChangeableProgram = currChangeableProgram.copyWith(
      description: event.description,
      muatable: event.muatable,
      name: event.name,
      programEnd: event.programEnd,
      programStart: event.programStart,
    );

    if (event.fromScratch != null && event.fromScratch == true) {
      currChangeableProgram = HabitProgram.base();
    }
    if (currChangeableProgram.name.isNotEmpty) {
      add(HabitProgramFinishedEditing());
    }
    if (event.habitDays != null) {
      currChangeableProgram =
          currChangeableProgram.copyWith(habitDays: event.habitDays);
    }

    emit(ProgramChanging(program: currChangeableProgram));
  }
}
