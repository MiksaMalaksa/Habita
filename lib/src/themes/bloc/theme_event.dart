part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class ThemeChangeTheme extends ThemeEvent {
  final ThemeMode themeMode;

  const ThemeChangeTheme({required this.themeMode});
}

final class ThemeChangeComb extends ThemeEvent {
  final String comb;

  const ThemeChangeComb({required this.comb});
}