import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/repositories/remote_repo.dart';

class GetProgramRemote implements Usecase<HabitProgram, String> {
  final IRemoteHabitRepo repository;

  const GetProgramRemote({required this.repository});

  @override
  Future<Either<Failure, HabitProgram>> call(String programId) async {
    return await repository.getHabitProgram(programId: programId);
  }
}
