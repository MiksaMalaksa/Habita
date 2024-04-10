import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/auth/domain/entities/user.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';


class UserSignUp implements Usecase<SupaUser, UserSignUpParams> {
  final IAuthRepo repository;

  const UserSignUp({required this.repository});

  @override
  Future<Either<Failure, SupaUser>> call(UserSignUpParams params) async {
    return await repository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
