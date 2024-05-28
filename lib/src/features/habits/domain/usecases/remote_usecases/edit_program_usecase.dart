import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/repositories/remote_repo.dart';

class EditProgramRemote implements Usecase<void, EditProgramRemoteParams> {
  final IRemoteHabitRepo repository;

  const EditProgramRemote({required this.repository});

  @override
  Future<Either<Failure, void>> call(EditProgramRemoteParams params) async {
    return await repository.editHabitProgram(
      programId: params.id,
      program: params.program,

    );
  }
}

class EditProgramRemoteParams {
  final String id;
  final HabitProgram program;


  const EditProgramRemoteParams({
    required this.id,
    required this.program,

  });
}
