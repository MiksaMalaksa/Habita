import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habita/core/constants/miksa_url.dart';

import 'package:url_launcher/url_launcher.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsGoTelegram>(_goToTelegram);
    on<SettingsGoGitHub>(_goToGitHub);
  }

  //*Launch links
  Future<void> _goToTelegram(
      SettingsGoTelegram event, Emitter<SettingsState> emit) async {
    await _goTo(event, emit, miksaUrl);
  }

  Future<void> _goToGitHub(
      SettingsGoGitHub event, Emitter<SettingsState> emit) async {
    await _goTo(event, emit, miksaGitUrl);
  }

  Future<void> _goTo(
      SettingsEvent event, Emitter<SettingsState> emit, String path) async {
    final toGoUri = Uri.parse(path);
    if (!await launchUrl(toGoUri)) {
      emit(SettingsError(errorMessage: 'Could not launch $toGoUri'));
    }
    emit(SettingsInitial());
  }
}
