import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';

abstract interface class IRemoteHabitRepo {
  Future<Either<Failure, HabitProgram>> getHabitProgram({
    required String programId,
  });

  Future<Either<Failure, void>> deleteHabitProgram({required String programId});

  Future<Either<Failure, void>> editHabitProgram({
    required String programId,
    required HabitProgram program,
    String? name,
    String? description,
    String? mutability,
    String? endDate,
    String? startDate,
  });

  Future<Either<Failure, void>> deleteHabit({
    required String habitId,
  });

  Future<Either<Failure, void>> editHabit({
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
