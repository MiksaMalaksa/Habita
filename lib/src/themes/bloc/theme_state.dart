part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  final ThemeMode currentMode;
  final ThemeData currentCustomThemeLight;
  final ThemeData currentCustomThemeDark;
  final String combName;

  const ThemeState(
    this.currentMode,
    this.currentCustomThemeLight,
    this.currentCustomThemeDark,
    this.combName,
  );

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
    String? combName,
  }) : super(
          mode ?? ThemeMode.system,
          lightComb ?? sakuraColoringLight,
          darkComb ?? sakuraColoringDark,
          combName ?? colorCombinations[0]
        );
}
