
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';

abstract interface class IHabitDataSource {
  Future<HabitProgram> getHabitProgram();

  Future<void> deleteHabitProgram();

  Future<void> editHabitProgram({
    required HabitProgram program,
  });
}
