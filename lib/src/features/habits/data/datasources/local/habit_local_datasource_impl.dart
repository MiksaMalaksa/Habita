import 'package:habita/src/features/habits/data/datasources/local/ihabit_local_datasource.dart';
import 'package:habita/src/features/habits/data/models/habit_program_model.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:hive/hive.dart';

class HabitDataSourceImpl implements IHabitDataSource {
  final Box box;

  const HabitDataSourceImpl({required this.box});


  @override
  Future<void> deleteHabitProgram() async {
    await box.delete('program');
  }

  @override
  Future<void> editHabitProgram({
    required HabitProgram program,
  }) async {
    await box.put('program', HabitProgramModel.fromEntity(program).toJson());
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
