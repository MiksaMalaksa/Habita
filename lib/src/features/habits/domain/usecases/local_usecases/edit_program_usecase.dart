import 'package:dartz/dartz.dart';

import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';

import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/repositories/habit_repo.dart';

//!If we want to
class EditProgram implements Usecase<void, EditProgramParams> {
  final IHabitRepo repository;

  const EditProgram({required this.repository});

  @override
  Future<Either<Failure, void>> call(EditProgramParams params) async {
    return await repository.editHabitProgram(

      program: params.program,
    );
  }
}

class EditProgramParams {
  final HabitProgram program;

  const EditProgramParams({
    required this.program,

  });
}
