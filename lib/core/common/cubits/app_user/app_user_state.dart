part of 'app_user_cubit.dart';

sealed class AppUserState extends Equatable {
  const AppUserState();

  @override
  List<Object?> get props => [];
}

class AppUserInitial extends AppUserState {}

final class AuthSignedOut extends AppUserState {}

class AppUserLoggedIn extends AppUserState {
  final SupaUser user;

  const AppUserLoggedIn({required this.user});

  @override
  List<String> get props => [user.email];
}

class AppUserLoading extends AppUserState {}

//!core can not depend on other features