import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/habits/domain/repositories/remote_repo.dart';

class DeleteProgramRemote implements Usecase<void, String> {
  final IRemoteHabitRepo repository;

  const DeleteProgramRemote({required this.repository});

  @override
  Future<Either<Failure, void>> call(String programId) async {
    return await repository.deleteHabitProgram(programId: programId);
  }
}
