import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/widgets/container_button_row_image.dart';
import 'package:habita/core/constants/colors.dart';
import 'package:habita/core/constants/flags.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/main.dart';
import 'package:habita/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/drop_down_button.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/profile_container.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/segmented_button.dart';
import 'package:habita/src/themes/app_theme.dart';
import 'package:habita/src/themes/app_theme_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      );
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.bold,
        );
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsError) {
          showSnackBar(
            context: context,
            content: state.errorMessage,
          );
        }
      },
      child: Scaffold(
          body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*profile showcase
            const ProfileContainer(),
            const SizedBox(height: 20),
            //*customization
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Text(S.of(context).customization, style: textTheme),
            ),
            const SizedBox(height: 20),
            const ThemeSelector(),
            const SizedBox(height: 20),
            //*color combinations
            Consumer<ThemeProvider>(builder: (context, theme, _) {
              return Center(
                  child: CustomizationDropDown(
                      entries: colorCombinations,
                      onChoosed: (String scheme) {
                        theme.setSelectedScheme(scheme);
                      }));
            }),
            const SizedBox(height: 5),
            //*internationalization
            Center(
                child: CustomizationDropDown(
                    entries: S.delegate.supportedLocales,
                    //*get flags on their code
                    icons: flags,
                    onChoosed: (String locale) {
                      Habita.of(context)!.setLocale(Locale(locale));
                    })),
            //*Additianal settings
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Text(S.of(context).additionalSettings, style: textTheme),
            ),
            const SizedBox(height: 10),
            //*Telegram
            Center(
              child: ContainerButtonRowImage(
                backColor: telegramColor,
                assetPath: 'assets/tg.png',
                content: S.of(context).telegram,
                onPressed: () =>
                    context.read<SettingsBloc>().add(SettingsGoTelegram()),
              ),
            ),
            const SizedBox(height: 10),
            //*GitHub
            Center(
              child: ContainerButtonRowImage(
                backColor: gitColor,
                assetPath: 'assets/git_hub.png',
                content: S.of(context).sourceCode,
                onPressed: () =>
                    context.read<SettingsBloc>().add(SettingsGoGitHub()),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
