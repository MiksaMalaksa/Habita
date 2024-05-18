import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';
import 'package:habita/core/usecase/usecase.dart';
import 'package:habita/src/features/auth/domain/repositories/iauth_repo.dart';

class DeleteUserAccount implements Usecase<void, String> {
  final IAuthRepo repository;
  const DeleteUserAccount({required this.repository});

  @override
  Future<Either<Failure, void>> call(String email) async {
    return await repository.deleteAccount(email: email);
  }
}
