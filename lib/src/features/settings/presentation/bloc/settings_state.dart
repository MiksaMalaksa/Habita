part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

final class SettingsInitial extends SettingsState {}

class SettingsError extends SettingsState {
  final String errorMessage;

  const SettingsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
