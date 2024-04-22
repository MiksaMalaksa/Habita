import 'package:flutter/material.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/network/connection_checker.dart';
import 'package:habita/src/features/habits/data/datasources/ihabit_datasource.dart';
import 'package:habita/src/features/habits/data/models/habit_program_model.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:hive/hive.dart';

class HabitDataSourceImpl implements IHabitDataSource {
  final Box box;
  final IConnectionChecker connectionChecker;

  const HabitDataSourceImpl(
      {required this.box, required this.connectionChecker});

  @override
  Future<void> createHabitProgram({required HabitProgram program}) async {
    //!supa things
    if (await connectionChecker.isConnected) {}
    final jsonProgram = HabitProgramModel.fromEntity(program).toJson();
    await box.put('program', jsonProgram);
  }

  @override
  Future<void> deleteHabitProgram() async {
    //!supa things
    if (await connectionChecker.isConnected) {}
    await box.delete('program');
  }

  @override
  Future<void> editHabitProgram(
      {int? weekday,
      String? name,
      String? reminder,
      String? aim,
      bool? muatable,
      String? programEnd,
      String? programStart,
      Color? habitColor,
      IconData? habitIcon,
      HabitType? habitType,
      String? habitName,
      String? habitDescription,
      bool? isCompletedHabit,
      double? waterTarget,
      double? waterConsumed,
      int? stepsTarget,
      int? stepsProduced,
      int? taskSteps,
      int? completedSteps}) {
    throw UnimplementedError();
  }

  @override
  Future<HabitProgram> getHabitProgram() async {
    final program = await box.get('program');
    if (program == null) {
      return HabitProgram.base();
    }
    return HabitProgramModel.fromJson(program);
  }
}
