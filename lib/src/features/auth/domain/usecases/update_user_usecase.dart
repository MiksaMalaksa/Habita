import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/auth/domain/entities/user.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';

class UpdateUser implements Usecase<SupaUser, UpdateUserParams> {
  final IAuthRepo repository;

  const UpdateUser({required this.repository});

  @override
  Future<Either<Failure, SupaUser>> call(UpdateUserParams params) async {
    return await repository.updateUser(
      name: params.name,
      email: params.email,
      password: params.password,
      oldPassword: params.oldPassword
    );
  }
}

class UpdateUserParams {
  final String name;
  final String password;
  final String email;
  final String oldPassword;

  const UpdateUserParams({
    required this.name,
    required this.password,
    required this.email,
    required this.oldPassword,
  });
}
