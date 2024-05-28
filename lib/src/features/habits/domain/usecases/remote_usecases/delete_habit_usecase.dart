import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/habits/domain/repositories/remote_repo.dart';

class DeleteHabitRemote implements Usecase<void, String> {
  final IRemoteHabitRepo repository;

  const DeleteHabitRemote({required this.repository});

  @override
  Future<Either<Failure, void>> call(String habitId) async {
    return await repository.deleteHabit(habitId: habitId);
  }
}
