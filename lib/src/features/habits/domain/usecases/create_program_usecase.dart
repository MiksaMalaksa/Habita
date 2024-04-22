import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/repositories/habit_repo.dart';

class CreateProgram implements Usecase<void, CreateProgramParams> {
  final IHabitRepo repository;

  const CreateProgram({required this.repository});

  @override
  Future<Either<Failure, void>> call(CreateProgramParams params) async {
    return await repository.createHabitProgram(program: params.program);
  }
}

class CreateProgramParams {
  final HabitProgram program;

  const CreateProgramParams({required this.program});
}
