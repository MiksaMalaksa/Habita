part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class SettingsUserSignOut extends SettingsEvent {}

final class SettingsUpdateUser extends SettingsEvent {
  final SupaUser currentUser;
  final String name;
  final String email;
  final String password;

  const SettingsUpdateUser(
      {required this.currentUser,
      required this.name,
      required this.email,
      required this.password});
}

final class SettingsGetUser extends SettingsEvent {}

final class SettingsGoTelegram extends SettingsEvent {}

final class SettingsGoGitHub extends SettingsEvent {}
