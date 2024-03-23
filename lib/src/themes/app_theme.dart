import 'package:flutter/material.dart';
import 'package:habita/src/themes/combinations/habbita_theme.dart';
import 'package:habita/src/themes/combinations/indigo.dart';
import 'package:habita/src/themes/combinations/purple_theme.dart';
import 'package:habita/src/themes/combinations/red_blue_theme.dart';
import 'package:habita/src/themes/combinations/sakura_theme.dart';

//!custom icons
class AppTheme {
  ThemeMode mode;
  IconData icon;

  AppTheme({required this.mode, required this.icon});
}

//!Themes and combs lists
List<AppTheme> appThemes = [
  AppTheme(
    mode: ThemeMode.light,
    icon: Icons.brightness_5_rounded,
  ),
  AppTheme(
    mode: ThemeMode.dark,
    icon: Icons.brightness_2_rounded,
  ),
];

//!In drop box there aree the names of themes and + theme mode = current comb
Map<String, ThemeData> combinations = {
  'MainLight': habitaColoringLight,
  'MainDark': habitaColoringDark,
  'IndigoLight': indigoColoringLight,
  'IndigoDark': indigoColoringDark,
  'PurpleLight': purpleColoringLight,
  'PurpleDark': purpleColoringDark,
  'Red-BlueLight': redBlueColoringLight,
  'Red-BlueDark': redBlueColoringDark,
  'SakuraLight': sakuraColoringLight,
  'SakuraDark': sakuraColoringDark
};
