import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/init_dependencies.dart';
import 'package:habita/src/features/settings/utils/shared_pref_utils.dart';
import 'package:habita/src/themes/app_theme.dart';
import 'package:habita/src/themes/bloc/theme_bloc.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: double.infinity,
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
              selected: {context.read<ThemeBloc>().state.currentMode},
              selectedIcon: null,
              onSelectionChanged: (Set<ThemeMode> newSelection) {
                context
                    .read<ThemeBloc>()
                    .add(ThemeChangeTheme(themeMode: newSelection.first));
                final themeExtractor = newSelection.first.toString().split('.');
                sl
                    .get<SharedPreferencesUtils>()
                    .addThemeMode(themeExtractor[1]);
              },
              emptySelectionAllowed: false,
              style: const ButtonStyle(
                  visualDensity: VisualDensity(horizontal: 4, vertical: 0)),
            ),
          ),
        );
      },
    );
  }
}
