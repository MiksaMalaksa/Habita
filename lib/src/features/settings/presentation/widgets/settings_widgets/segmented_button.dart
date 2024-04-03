import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/themes/app_theme.dart';
import 'package:habita/src/themes/app_theme_provider.dart';
import 'package:provider/provider.dart';

//!Fix colors in profile
//!OnTapped show titles

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  Set<ThemeMode> selections = {ThemeMode.system};

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (BuildContext context, theme, child) {
      return Center(
        child: SegmentedButton(
          multiSelectionEnabled: false,
          segments: <ButtonSegment<ThemeMode>>[
            ButtonSegment<ThemeMode>(
              value: ThemeMode.light,
              tooltip: S.of(context).light,
              icon: Icon(
                appThemes[0].icon,
                size: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            ButtonSegment<ThemeMode>(
              value: ThemeMode.dark,
              tooltip: S.of(context).dark,
              icon: Icon(
                appThemes[1].icon,
                size: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            ButtonSegment<ThemeMode>(
              value: ThemeMode.system,
              tooltip: S.of(context).system,
              icon: Icon(
                appThemes[2].icon,
                size: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
          ],
          selected: selections,
          selectedIcon: null,
          onSelectionChanged: (Set<ThemeMode> newSelection) {
            theme.setSelectedTheme(newSelection.first);
            selections = {theme.currentMode};
          },
          emptySelectionAllowed: false,
          style: const ButtonStyle(
              visualDensity: VisualDensity(horizontal: 4, vertical: 0)),
        ),
      );
    });
  }
}
