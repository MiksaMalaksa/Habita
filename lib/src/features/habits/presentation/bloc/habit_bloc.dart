import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habita/core/common/widgets/date_picker_configes.dart';
import 'package:habita/src/features/habits/domain/entities/habit_day.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:intl/intl.dart';

part 'habit_event.dart';
part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  HabitBloc() : super(HabitInitial()) {
    on<HabitProgramChanging>(_programChangedHandler);
  }

  //!Case when we edit, but not submit changes
  void _programChangedHandler(
    HabitProgramChanging event,
    Emitter<HabitState> emit,
  ) {
    final currentState = state;
    late HabitProgram currChangeableProgram;

    if (currentState is HabitChanging) {
      currChangeableProgram = currentState.changeableProgram;
    } else {
      currChangeableProgram = HabitProgram(
        habits: [],
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
      habits: event.habits,
      muatable: event.muatable,
      name: event.name,
      programEnd: event.programEnd,
      programStart: event.programStart,
    );

    emit(HabitChanging(changeableProgram: currChangeableProgram));
  }
}
