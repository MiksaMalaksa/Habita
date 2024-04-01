import 'package:flutter/material.dart';
import 'package:habita/src/themes/app_theme.dart';
import 'package:habita/src/themes/app_theme_provider.dart';
import 'package:provider/provider.dart';

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
              label: const Text('Light'),
              icon: Icon(appThemes[0].icon),
            ),
            ButtonSegment<ThemeMode>(
              value: ThemeMode.dark,
              label: const Text('Dark'),
              icon: Icon(appThemes[1].icon),
            ),
            ButtonSegment<ThemeMode>(
              value: ThemeMode.system,
              label: const Text('System'),
              icon: Icon(appThemes[2].icon),
            ),
          ],
          selected: selections,
          onSelectionChanged: (Set<ThemeMode> newSelection) {
            theme.setSelectedTheme(newSelection.first);
            selections = {theme.currentMode};
          },
          emptySelectionAllowed: false,
          style: const ButtonStyle(
              visualDensity: VisualDensity(horizontal: 3, vertical: 1)),
        ),
      );
    });
  }
}
