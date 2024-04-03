import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/core/common/entities/user.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';


class UserSignIn implements Usecase<SupaUser, UserSignInParams> {
  final IAuthRepo repository;

  const UserSignIn({required this.repository});

  @override
  Future<Either<Failure, SupaUser>> call(UserSignInParams params) async {
    return await repository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({
    required this.email,
    required this.password,
  });
}
