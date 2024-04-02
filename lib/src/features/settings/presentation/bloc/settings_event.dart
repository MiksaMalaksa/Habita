part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class SettingsGoTelegram extends SettingsEvent{}

final class SettingsGoGitHub extends SettingsEvent{}