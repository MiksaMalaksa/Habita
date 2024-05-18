import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habita/core/common/blocs/bloc/internetconnection_bloc.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/init_dependencies.dart';
import 'package:habita/page_manager.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/auth/presentation/pages/login_page.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:habita/src/features/settings/utils/shared_pref_utils.dart';
import 'package:habita/src/themes/bloc/theme_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialise();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<SettingsBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<InternetConnectionBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<ThemeBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<HabitBloc>(),
        ),
      ],
      child: const Habita(),
    ),
  );
}

class Habita extends StatefulWidget {
  const Habita({super.key});

  @override
  HabitaState createState() => HabitaState();

  static HabitaState? of(BuildContext context) =>
      context.findAncestorStateOfType<HabitaState>();
}

class HabitaState extends State<Habita> {
  Locale? currentLocale;

  void setLocale(Locale newLocale) {
    setState(() {
      currentLocale = newLocale;
    });
  }

  @override
  void initState() {
    super.initState();
    //*auth
    context.read<AuthBloc>().add(AuthLoggedIn());
    //*styling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sl.get<SharedPreferencesUtils>().getLang().then((lang) => {
            setLocale(Locale.fromSubtags(languageCode: lang)),
          });
      sl.get<SharedPreferencesUtils>().getThemeMode().then((mode) {
        ThemeMode currentMode = mode == 'dark'
            ? ThemeMode.dark
            : mode == 'light'
                ? ThemeMode.light
                : ThemeMode.system;
        context.read<ThemeBloc>().add(ThemeChangeTheme(themeMode: currentMode));
      });
      sl.get<SharedPreferencesUtils>().getThemeComb().then((comb) {
        context.read<ThemeBloc>().add(ThemeChangeComb(comb: comb));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          themeAnimationCurve: Curves.fastOutSlowIn,
          themeAnimationDuration: const Duration(milliseconds: 500),
          ////*Theme spec
          themeMode: state.currentMode,
          theme: state.currentCustomThemeLight,
          darkTheme: state.currentCustomThemeDark,
          ////*Internationalization
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          //*Set locale depanding on system ones, first in priority is choosed
          //*for the app locale, otherwise english
          localeListResolutionCallback: (deviceLocales, supportedLocales) {
            final supportedCodes = supportedLocales.map((e) => e.languageCode);
            if (deviceLocales != null && currentLocale == null) {
              for (final locale in deviceLocales) {
                if (supportedCodes.contains(locale.languageCode)) {
                  return locale;
                }
              }
            } else {
              return currentLocale;
            }
            return const Locale('en');
          },
          locale: currentLocale,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoggedIn) {
                return const PageManager();
              } else {
                return const LoginPage();
              }
            },
          ),
        );
      },
    );
  }
}
