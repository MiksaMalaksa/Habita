part of 'app_user_cubit.dart';

sealed class AppUserState extends Equatable {
  const AppUserState();

  @override
  List<Object> get props => [];
}

final class AppUserInitial extends AppUserState {}

final class AppUserLoggedIn extends AppUserState {
  final SupaUser user;

  const AppUserLoggedIn({required this.user});
}

final class AppUserLoading extends AppUserState{}

//!core can not depend on other features