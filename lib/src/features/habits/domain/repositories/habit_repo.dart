import 'package:dartz/dartz.dart';

import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';

abstract interface class IHabitRepo {
  Future<Either<Failure, HabitProgram>> getHabitProgram();

  Future<Either<Failure, void>> deleteHabitProgram();

  Future<Either<Failure, void>> editHabitProgram({
    required HabitProgram program,
  });
}
