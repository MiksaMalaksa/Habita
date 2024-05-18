part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const AuthSignUp({
    required this.name,
    required this.email,
    required this.password,
  });
}

final class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  const AuthSignIn({
    required this.email,
    required this.password,
  });
}

final class AuthLoggedIn extends AuthEvent {}

final class AuthSignOut extends AuthEvent {}

final class DeleteUserEvent extends AuthEvent {}

final class AuthUpdateUser extends AuthEvent {
  final String? name;
  final String? email;
  final String? password;
  final String? oldPassword;
  final String? imagePath;
  final File? imageFile;

  const AuthUpdateUser({
    this.name,
    this.email,
    this.password,
    this.oldPassword,
    this.imagePath,
    this.imageFile,
  });
}
