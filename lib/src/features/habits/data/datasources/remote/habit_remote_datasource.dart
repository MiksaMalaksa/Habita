import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/src/features/habits/data/datasources/remote/ihabit_remote_datasource.dart';
import 'package:habita/src/features/habits/data/models/habit_program_model.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HabitRemoteDataSourceImpl implements IRemoteHabitDataSource {
  final SupabaseClient client;

  const HabitRemoteDataSourceImpl({required this.client});

  @override
  Future<void> deleteHabitProgram({required String programId}) async {
    await client.from('habit_program').delete().eq('id', programId);
  }

  @override
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
  }) async {
    await client.from('habit').update({
      'color': color ?? habit.color,
      'icon': icon ?? habit.color,
      'habit_type': habitType ?? habit.color,
      'name': name ?? habit.name,
      'is_completed': isCompleted ?? habit.isCompleted,
      'highest_streak': highestStreak ?? habit.highestStreak,
      'current_streak': currentStreak ?? habit.currentStreak,
      'description': description ?? habit.description,
      'water_target': waterTarget ?? habit.waterTarget,
      'water_consumed': waterConsumed ?? habit.waterConsumed,
      'steps_target': stepsTarget ?? habit.stepsTarget,
      'steps_produced': stepsProduced ?? habit.stepsProduced,
      'completed_steps': completedSteps ?? habit.completedSteps,
      'task_steps': taskSteps ?? habit.taskSteps,
      'remainder': remainder ?? habit.remainder,
    }).eq('habit_id', id);
  }

  @override
  Future<void> editHabitProgram({
    required String programId,
    required HabitProgram program,
  }) async {
    final check =
        await client.from('habit_program').select('id').eq('id', programId);
    if (check.isEmpty) {
      await client.from('habit_program').insert({
        'id': program.id,
        'name': program.name,
        'description': program.description,
        'start_of_program': program.programStart,
        'end_of_program': program.programEnd,
        'mutability': program.muatable,
      });

      for (int i = 0; i < program.habitDays.length; i++) {
        final habitDay = program.habitDays[i];
        await client.from('habit_day').insert({
          'day_id': habitDay.id,
          'day_order': habitDay.weekday,
          'program_id': program.id,
        });

        for (int j = 0; j < habitDay.habits.length; j++) {
          final habit = habitDay.habits[j];
          await client.from('habit').insert({
            'habit_id': habit.id,
            'repetetive_habit_id': habit.habitId,
            'color': habit.color.value.toString(),
            'icon': habit.icon.codePoint.toString(),
            'type': habit.habitType.toShortString(),
            'name': habit.name,
            'description': habit.description,
            'is_completed': habit.isCompleted,
            'highest_streak': habit.highestStreak,
            'current_streak': habit.currentStreak,
            'water_target': habit.waterTarget,
            'water_consumed': habit.waterConsumed,
            'steps_produced': habit.stepsProduced,
            'steps_target': habit.stepsTarget,
            'completed_steps': habit.completedSteps,
            'remainder': habit.remainder,
          });
        }
      }
    } else {
      await client.from('habit_program').update({
        'name': program.name,
        'description': program.description,
        'start_of_program': program.programStart,
        'end_of_program': program.programEnd,
        'mutability': program.muatable,
      }).eq('id', programId);
    }
  }

  @override
  Future<HabitProgram> getHabitProgram({required String programId}) async {
    final result = await client.from('habit_program').select('*');

    final programs =
        result.map((prog) => HabitProgramModel.fromMap(prog)).toList();

    return programs.firstWhere((element) => element.id == programId);
  }

  @override
  Future<void> deleteHabit({required String habitId}) async {
    await client.from('habit').delete().eq('habit_id', habitId);
  }
}
