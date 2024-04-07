part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  final ThemeMode currentMode;
  final ThemeData currentCustomThemeLight;
  final ThemeData currentCustomThemeDark;
  const ThemeState(this.currentMode, this.currentCustomThemeLight,
      this.currentCustomThemeDark);

  @override
  List<Object?> get props => [
        currentMode,
        currentCustomThemeLight,
        currentCustomThemeDark,
      ];
}

class ThemeInitial extends ThemeState {
  ThemeInitial({
    ThemeMode? mode,
    ThemeData? lightComb,
    ThemeData? darkComb,
  }) : super(
          mode ?? ThemeMode.system,
          lightComb ?? sakuraColoringLight,
          darkComb ?? sakuraColoringDark,
        );
}
