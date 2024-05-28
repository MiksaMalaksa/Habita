
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';

abstract interface class IRemoteHabitDataSource {
  Future<HabitProgram> getHabitProgram({required String programId});

  Future<void> deleteHabitProgram({required String programId});

  Future<void> editHabitProgram({
    required String programId,
    required HabitProgram program,

  });

  Future<void> deleteHabit({
    required String habitId,
  });


  Future<void> editHabit({
    required String id,
      required Habit habit,
    String? programId,
    String? habitId,
    int? color,
    int? icon,
    String? habitType,
    String? name,
    bool? isCompleted,
    int? highestStreak,
    int? currentStreak,
    String? description,
    int? waterTarget,
    int? waterConsumed,
    int? stepsTarget,
    int? stepsProduced,
    int? completedSteps,
    int? taskSteps,
    String? remainder,
  });
}
