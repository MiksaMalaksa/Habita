import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/domain/repositories/habit_repository.dart';

class GetProgram implements Usecase<HabitProgram, NoParams> {
  final IHabitRepo repository;

  const GetProgram({required this.repository});

  @override
  Future<Either<Failure, HabitProgram>> call(NoParams params) async {
    return await repository.getHabitProgram();
  }
}
