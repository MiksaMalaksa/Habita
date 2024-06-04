part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final SupaUser? user;
  const AuthState(this.user);

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial(super.user);

  @override
  List<Object> get props => [];
}

//!Habita logo
class AuthGreet extends AuthState {
  const AuthGreet(super.user);

  @override
  List<Object> get props => [];
}

//!App states
class AuthUserLogged extends AuthState {
  const AuthUserLogged(super.user);

  @override
  List<Object> get props => [];
}

//*Default states
class AuthProcessing extends AuthState {
  const AuthProcessing(super.user);

  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String errorMessage;

  const AuthError(super.user, {required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class AuthLoaded extends AuthState {
  const AuthLoaded(super.user);

  @override
  List<Object?> get props => [
        user?.email,
        user?.name,
        user?.imagePath,
      ];
}

class AuthUpdated extends AuthState {
  const AuthUpdated(super.user);
}
