import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:habita/src/themes/app_theme.dart';
import 'package:habita/src/themes/combinations/sakura_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeMode _mode = ThemeMode.system;
  ThemeData _customThemeLight = sakuraColoringLight;
  ThemeData _customThemeDark = sakuraColoringDark;

  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeChangeTheme>(
      (event, emit) {
        _mode = event.themeMode;
        emit(ThemeInitial(
            mode: _mode,
            lightComb: _customThemeLight,
            darkComb: _customThemeDark));
      },
    );
    on<ThemeChangeComb>(
      (event, emit) {
        if (combinations.containsKey('${event.comb}' 'Light') &&
            combinations.containsKey('${event.comb}' 'Dark')) {
          _customThemeLight = combinations['${event.comb}' 'Light']!;
          _customThemeDark = combinations['${event.comb}' 'Dark']!;

          emit(ThemeInitial(
            mode: _mode,
            lightComb: _customThemeLight,
            darkComb: _customThemeDark,
          ));
        }
      },
    );
  }
}
