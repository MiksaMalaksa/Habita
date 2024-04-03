import 'package:flutter/material.dart';
import 'package:habita/src/themes/app_theme.dart';
import 'package:habita/src/themes/combinations/sakura_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode currentMode = ThemeMode.system;

  void setSelectedTheme(ThemeMode mode) {
    currentMode = mode;
    notifyListeners();
  }

  ThemeData currentCustomThemeLight = sakuraColoringLight;
  ThemeData currentCustomThemeDark = sakuraColoringDark;

  //!Add suffix to theme defining its mode belonging
  void setSelectedScheme(String scheme) {
    if (combinations.containsKey('$scheme' 'Light') &&
        combinations.containsKey('$scheme' 'Dark')) {
      currentCustomThemeLight = combinations['$scheme' 'Light']!;
      currentCustomThemeDark = combinations['$scheme' 'Dark']!;
    }
    notifyListeners();
  }
}
