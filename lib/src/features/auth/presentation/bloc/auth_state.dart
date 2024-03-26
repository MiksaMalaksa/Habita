part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthProcessing extends AuthState {}

final class AuthError extends AuthState {
  final String errorMessage;

  const AuthError({required this.errorMessage});
}

final class AuthLoaded extends AuthState {
  final String uid;

  const AuthLoaded({required this.uid});
}
