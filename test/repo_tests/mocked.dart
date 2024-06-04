import 'package:mockito/mockito.dart';
import 'package:habita/src/features/habits/data/datasources/remote/ihabit_remote_datasource.dart';

class MockRemoteHabitDataSource extends Mock implements IRemoteHabitDataSource {
  @override
  Future<void> deleteHabit({required String habitId}) {
    return super.noSuchMethod(Invocation.method(#deleteHabit, [habitId]),
        returnValue: Future.value(),
        returnValueForMissingStub: Future.value()) as Future<void>;
  }

  @override
  Future<void> deleteHabitProgram({required String programId}) {
    return super.noSuchMethod(Invocation.method(#deleteHabitProgram, [programId]),
        returnValue: Future.value(),
        returnValueForMissingStub: Future.value()) as Future<void>;
  }
}
