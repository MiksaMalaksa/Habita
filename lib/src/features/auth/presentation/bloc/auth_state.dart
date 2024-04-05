part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

//!App states
class AuthUserLogged extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthExit extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

//*Default states
class AuthProcessing extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthEntering extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String errorMessage;

  const AuthError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class AuthLoaded extends AuthState {
  final SupaUser user;

  const AuthLoaded({required this.user});

  @override
  List<Object> get props => [user];
}