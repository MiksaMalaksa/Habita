import 'package:dartz/dartz.dart';
import 'package:habita/core/common/entities/user.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/settings/domain/repo/isettings_repo.dart';

class UpdateUser implements Usecase<SupaUser, UpdateUserParams> {
  final ISettingsRepo repository;

  const UpdateUser({required this.repository});

  @override
  Future<Either<Failure, SupaUser>> call(UpdateUserParams params) async {
    return await repository.updateUser(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UpdateUserParams {
  final String name;
  final String password;
  final String email;

  const UpdateUserParams({
    required this.name,
    required this.password,
    required this.email,
  });
}
