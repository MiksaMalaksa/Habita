import 'package:flutter/material.dart';
import 'package:habita/src/themes/combinations/indigo.dart';
import 'package:habita/src/themes/combinations/purple_theme.dart';
import 'package:habita/src/themes/combinations/red_blue_theme.dart';
import 'package:habita/src/themes/combinations/sakura_theme.dart';
import 'package:fluttericon/entypo_icons.dart';

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
    icon: Icons.sunny,
  ),
  AppTheme(
    mode: ThemeMode.dark,
    icon: Icons.brightness_2_rounded,
  ),
  AppTheme(
    mode: ThemeMode.system,
    icon: Entypo.cog,
  )
];

List<String> colorCombinations = [
  'Sakura',
  'Indigo',
  'Purple',
  'Red-Blue',
];

//!In drop box there aree the names of themes and + theme mode = current comb
Map<String, ThemeData> combinations = {
  '${colorCombinations[0]}Light': sakuraColoringLight,
  '${colorCombinations[0]}Dark': sakuraColoringDark,
  '${colorCombinations[1]}Light': indigoColoringLight,
  '${colorCombinations[1]}Dark': indigoColoringDark,
  '${colorCombinations[2]}Light': purpleColoringLight,
  '${colorCombinations[2]}Dark': purpleColoringDark,
  '${colorCombinations[3]}Light': redBlueColoringLight,
  '${colorCombinations[3]}Dark': redBlueColoringDark,
};
