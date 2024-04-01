import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/no_params.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/core/common/entities/user.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';

class CurrentUser implements Usecase<User, NoParams> {
  final IAuthRepo repository;

  const CurrentUser({required this.repository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.currentUser();
  }
}
