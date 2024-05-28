import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/repositories/remote_repo.dart';

class EditHabitRemote implements Usecase<void, EditHabitRemoteParams> {
  final IRemoteHabitRepo repository;

  const EditHabitRemote({required this.repository});

  @override
  Future<Either<Failure, void>> call(EditHabitRemoteParams params) async {
    return await repository.editHabit(
      id: params.id,
      habit: params.habit,
      color: params.color,
      completedSteps: params.completedSteps,
      currentStreak: params.currentStreak,
      description: params.description,
      habitId: params.habitId,
      habitType: params.habitType,
      highestStreak: params.highestStreak,
      icon: params.icon,
      isCompleted: params.isCompleted,
      name: params.name,
      programId: params.programId,
      remainder: params.remainder,
      stepsProduced: params.stepsProduced,
      stepsTarget: params.stepsTarget,
      taskSteps: params.taskSteps,
      waterConsumed: params.waterConsumed,
      waterTarget: params.waterTarget,
    );
  }
}

class EditHabitRemoteParams {
  final String id;
  final Habit habit;
  final String? programId;
  final String? habitId;
  final int? color;
  final int? icon;
  final String? habitType;
  final String? name;
  final bool? isCompleted;
  final int? highestStreak;
  final int? currentStreak;
  final String? description;
  final int? waterTarget;
  final int? waterConsumed;
  final int? stepsTarget;
  final int? stepsProduced;
  final int? completedSteps;
  final int? taskSteps;
  final String? remainder;

  const EditHabitRemoteParams({
    required this.id,
    required this.habit,
    required this.programId,
    required this.habitId,
    required this.color,
    required this.icon,
    required this.habitType,
    required this.name,
    required this.isCompleted,
    required this.highestStreak,
    required this.currentStreak,
    required this.description,
    required this.waterTarget,
    required this.waterConsumed,
    required this.stepsTarget,
    required this.stepsProduced,
    required this.completedSteps,
    required this.taskSteps,
    required this.remainder,
  });
}
