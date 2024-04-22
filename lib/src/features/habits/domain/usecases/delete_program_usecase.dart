import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/habits/domain/repositories/habit_repo.dart';

class DeleteProgram implements Usecase<void, NoParams> {
  final IHabitRepo repository;

  const DeleteProgram({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.deleteHabitProgram();
  }
}
