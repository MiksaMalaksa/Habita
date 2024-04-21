import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/blocs/bloc/internetconnection_bloc.dart';
import 'package:habita/core/common/entities/dialog.dart';
import 'package:habita/core/common/widgets/container_button_row_image.dart';
import 'package:habita/core/common/widgets/loader.dart';
import 'package:habita/core/constants/colors.dart';
import 'package:habita/core/constants/exceptions_messages.dart';
import 'package:habita/core/constants/flags.dart';
import 'package:habita/core/utils/show_dialog.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/init_dependencies.dart';
import 'package:habita/main.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:habita/core/common/widgets/drop_down_menu.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/profile_container.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/segmented_button.dart';
import 'package:habita/src/features/settings/utils/shared_pref_utils.dart';
import 'package:habita/src/themes/app_theme.dart';
import 'package:habita/src/themes/bloc/theme_bloc.dart';

class ProfilePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      );
  const ProfilePage({super.key});

  void _settingsDialog(BuildContext context) {
    dialogBuilder(
      context: context,
      atributes: DialogAtributes(
          label: S.of(context).noConnection,
          body: S.of(context).settingsNoInternet),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(fontWeight: FontWeight.bold);

    return BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SettingsError) {
            showSnackBar(
              context: context,
              content: ErrorsConventer()
                  .convertedMsg(context, msg: state.errorMessage),
            );
          }
        },
        child: SafeArea(
          child: Scaffold(
              body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => state is AuthLoaded
                ? SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //*profile showcase
                        ProfileContainer(
                          name: state.user.name,
                          email: state.user.email,
                        ),
                        const SizedBox(height: 20),
                        //*customization
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8),
                          child: Text(S.of(context).customization,
                              style: textTheme),
                        ),
                        const SizedBox(height: 20),
                        //*Segmented selector
                        const ThemeSelector(),
                        const SizedBox(height: 20),
                        //*color combinations
                        Center(
                            child: HabitaDropDown<String>(
                                entries: colorCombinations,
                                initialValue:
                                    context.read<ThemeBloc>().state.combName,
                                onChoosed: (String scheme) {
                                  context
                                      .read<ThemeBloc>()
                                      .add(ThemeChangeComb(comb: scheme));
                                  sl
                                      .get<SharedPreferencesUtils>()
                                      .addThemeComb(scheme);
                                })),
                        const SizedBox(height: 5),
                        //*internationalization
                        Center(
                            child: HabitaDropDown<Locale>(
                                initialValue:
                                    Habita.of(context)!.currentLocale!,
                                entries: S.delegate.supportedLocales,
                                //*get flags based on their locale code
                                icons: flags,
                                onChoosed: (String locale) {
                                  Habita.of(context)!.setLocale(Locale(locale));
                                  sl
                                      .get<SharedPreferencesUtils>()
                                      .addLang(locale);
                                })),
                        //*Additianal settings
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8),
                          child: Text(S.of(context).additionalSettings,
                              style: textTheme),
                        ),
                        const SizedBox(height: 10),
                        //*Telegram
                        Center(
                          child: ContainerButtonRowImage(
                            backColor: telegramColor,
                            assetPath: 'assets/tg.png',
                            content: S.of(context).telegram,
                            onPressed: () {
                              if (BlocProvider.of<InternetConnectionBloc>(
                                      context)
                                  .state
                                  .isConnected) {
                                context.read<SettingsBloc>().add(
                                      SettingsGoTelegram(),
                                    );
                              } else {
                                _settingsDialog(context);
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        //*GitHub
                        Center(
                          child: ContainerButtonRowImage(
                            backColor: gitColor,
                            assetPath: 'assets/git_hub.png',
                            content: S.of(context).sourceCode,
                            onPressed: () {
                              if (BlocProvider.of<InternetConnectionBloc>(
                                      context)
                                  .state
                                  .isConnected) {
                                context.read<SettingsBloc>().add(
                                      SettingsGoGitHub(),
                                    );
                              } else {
                                _settingsDialog(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const Loader(),
          )),
        ));
  }
}
