import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/settings/domain/repo/isettings_repo.dart';

class UserSignOut implements Usecase<void, NoParams> {
  final ISettingsRepo repository;

  const UserSignOut({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.signOut();
  }
}
