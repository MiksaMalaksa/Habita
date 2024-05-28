import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/core/constants/exceptions_messages.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/extensions/substruct_dates.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_day.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/usecases/local_usecases/delete_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/local_usecases/edit_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/local_usecases/get_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/delete_habit_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/delete_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/edit_habit_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/edit_program_usecase.dart';
import 'package:habita/src/features/habits/domain/usecases/remote_usecases/get_program_usecase.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'habit_event.dart';
part 'habit_state.dart';

//!Usecase сохранения
//!Выполнение привычки
//!Разобраться как искать permissons у приложения
//!Yandex биндинги и yandex trees
//!залогировать сегодня и сделать план на завтра

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  //*hive Usecases
  final GetProgram _getProgram;
  final DeleteProgram _deleteProgram;
  final EditProgram _editProgram;

  //*supa Usecases
  final DeleteHabitRemote _deleteHabitRemote;
  final DeleteProgramRemote _deleteProgramRemote;
  final EditHabitRemote _editHabitRemote;
  final EditProgramRemote _editProgramRemote;
  final GetProgramRemote _getProgramRemote;

  HabitBloc({
    required GetProgram getProgram,
    required DeleteProgram deleteProgram,
    required EditProgram editProgram,
    required DeleteHabitRemote deleteHabitRemote,
    required DeleteProgramRemote deleteProgramRemote,
    required EditHabitRemote editHabitRemote,
    required EditProgramRemote editProgramRemote,
    required GetProgramRemote getProgramRemote,
  })  : _getProgram = getProgram,
        _deleteProgram = deleteProgram,
        _editProgram = editProgram,
        _deleteHabitRemote = deleteHabitRemote,
        _deleteProgramRemote = deleteProgramRemote,
        _editHabitRemote = editHabitRemote,
        _editProgramRemote = editProgramRemote,
        _getProgramRemote = getProgramRemote,
        super(HabitLoading(program: HabitProgram.base())) {
    on<HabitProgramChange>(_programChangedHandler);
    on<HabitChange>(_habitChangeHandler);
    on<HabitProgramFinishedEditing>(_finishedHandler);
    on<GetHabitProgram>(_getProgramHandler);
    on<DeleteHabitProgram>(_deleteProgramHandler);
    on<ChangeHabitStats>(_editHabitStatsHandler);
  }

  Future<void> _deleteProgramHandler(
      DeleteHabitProgram event, Emitter<HabitState> emit) async {
    final result = await _deleteProgram(NoParams());

    if (await InternetConnectionChecker().hasConnection) {
      await _deleteProgramRemote(state.program.id);
    }

    result.fold(
      (_) => Error(message: serverFailMsg, program: state.program),
      (program) {
        emit(HabitInitial(program: HabitProgram.base()));
      },
    );
  }

  //!Change only 1 habit stats, not global editing
  Future<void> _editHabitStatsHandler(
      ChangeHabitStats event, Emitter<HabitState> emit) async {
    final newDays = state.program.habitDays;
    if (event.habitId != null && event.dayIndex != null) {
      newDays[event.dayIndex!].habits[event.habitId!] =
          newDays[event.dayIndex!].habits[event.habitId!].copyWith(
                color: event.habitColor,
                completedSteps: event.completedSteps,
                description: event.habitDescription,
                habitType: event.habitType,
                icon: event.habitIcon,
                name: event.habitName,
                remainder: event.reminder,
                stepsProduced: event.stepsProduced,
                taskSteps: event.taskSteps,
                waterConsumed: event.waterConsumed,
                waterTarget: event.waterTarget,
              );
    }

    if (event.habitId != null && event.dayIndex != null) {
      final changeableDay = newDays[event.dayIndex!].habits[event.habitId!];
      //*water
      if (changeableDay.waterConsumed != null &&
          changeableDay.waterConsumed! >= changeableDay.waterTarget!) {
        newDays[event.dayIndex!].habits[event.habitId!] =
            changeableDay.copyWith(
          isCompleted: true,
        );
      }
      //*steps
      if (changeableDay.stepsProduced != null &&
          changeableDay.stepsProduced! >= changeableDay.stepsTarget!) {
        newDays[event.dayIndex!].habits[event.habitId!] =
            changeableDay.copyWith(isCompleted: true);
      }
      //*task steps
      if (changeableDay.completedSteps != null &&
          changeableDay.completedSteps! >= changeableDay.taskSteps!) {
        newDays[event.dayIndex!].habits[event.habitId!] =
            changeableDay.copyWith(isCompleted: true);
      }

      final newProgram = state.program.copyWith(
        description: event.aim,
        muatable: event.muatable,
        habitDays: newDays,
        name: event.name,
        programEnd: event.programEnd,
        programStart: event.programStart,
      );
      final result = await _editProgram(EditProgramParams(
        program: newProgram,
      ));
      result.fold(
        (_) => Error(message: serverFailMsg, program: state.program),
        (_) {
          if (state is ProgramChanging) {
            emit(HabitInitial(program: newProgram));
          } else {
            emit(ProgramChanging(program: newProgram));
          }
        },
      );
    }
  }

  Future<void> _getProgramHandler(
      GetHabitProgram event, Emitter<HabitState> emit) async {
    if (state.program.name.isEmpty) {
      final result = await _getProgram(NoParams());
      result.fold(
        (_) => Error(message: serverFailMsg, program: state.program),
        (program) {
          final currentDay = DateTime.now();
          final parsedDay = DateFormat(dateFormat).format(currentDay);
          //! 2 cases: on week beyond week
          int emptyDays = 7 -
              (program.habitDays.length -
                  parsedDay.dateDifference(program.programStart));

          for (int i = 0; emptyDays > 0; i %= 7, emptyDays--) {
            program.habitDays.add(HabitDay(
                id: const Uuid().v4(),
                weekday: i + 1,
                habits: program.habitDays[i].habits
                    .map((habitToCopy) => Habit.emptyCopy(habit: habitToCopy))
                    .toList()));
            i++;
          }

          emit(HabitInitial(program: program));
        },
      );
    }
  }

  Future<void> _finishedHandler(
      HabitProgramFinishedEditing event, Emitter<HabitState> emit) async {
    final result =
        await _editProgram(EditProgramParams(program: state.program));

    if (await InternetConnectionChecker().hasConnection) {
      final program = state.program;
      await _editProgramRemote(
        EditProgramRemoteParams(
          id: program.id,
          program: program,
        ),
      );
    }

    result.fold(
      (_) => Error(message: serverFailMsg, program: state.program),
      (_) => ProgramChanging(program: state.program),
    );
  }

  void _habitChangeHandler(HabitChange event, Emitter<HabitState> emit) {
    final currentState = state;
    final currentProgram = state.program;
    late Habit currChangeableHabit;

    if (currentState is HabitChanging) {
      if (event.id != null &&
          event.habitId != null &&
          event.id != currentState.changeableHabit.id) {
        currChangeableHabit =
            Habit.base(id: event.id!, habitId: event.habitId!);
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
          waterTarget: event.waterTarget,
          taskSteps: event.stepsTarget,
        );
        if (event.dropReminder == true) {
          currChangeableHabit = currChangeableHabit.nullCopy(remainder: '');
        }
      }
    } else {
      currChangeableHabit =
          Habit.base(id: event.habitId!, habitId: event.habitId!);
    }

    emit(
      HabitChanging(
        changeableHabit: currChangeableHabit,
        program: currentProgram,
      ),
    );
  }

  void _programChangedHandler(
    HabitProgramChange event,
    Emitter<HabitState> emit,
  ) {
    final currentState = state;
    HabitProgram currChangeableProgram = currentState.program;

    if (event.habit != null && event.days != null) {
      for (var day in event.days!) {
        final copyHabit = event.habit!.copyWith(id: const Uuid().v4());
        currChangeableProgram.habitDays[day].habits.add(copyHabit);
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
