import 'package:flutter_test/flutter_test.dart';
import 'package:habita/core/constants/exceptions_messages.dart';
import 'package:habita/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:habita/src/features/habits/data/repositories/remote_habit_repo_impl.dart';
import 'package:mockito/mockito.dart';
import 'mocked.dart';

void main() {
  late RemoteHabitRepoImpl repository;
  late MockRemoteHabitDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRemoteHabitDataSource();
    repository = RemoteHabitRepoImpl(dataSource: mockDataSource);
  });

  group('deleteHabit', () {
    const habitId = 'habitId';

    test('should call deleteHabit on the data source', () async {
      when(mockDataSource.deleteHabit(habitId: habitId))
          .thenAnswer((_) async => Future.value());

      final result = await repository.deleteHabit(habitId: habitId);

      verify(mockDataSource.deleteHabit(habitId: habitId)).called(1);
      expect(result, const Right(null));
    });

    test('should return ServerFailure when an exception occurs', () async {
      when(mockDataSource.deleteHabit(habitId: habitId))
          .thenThrow(Exception());

      final result = await repository.deleteHabit(habitId: habitId);

      expect(result, const Left(ServerFailure(message: serverFailMsg)));
    });
  });
}
