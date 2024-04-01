import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habita/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/init_dependencies.dart';
import 'package:habita/page_manager.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/auth/presentation/pages/login_page.dart';
import 'package:habita/src/themes/app_theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialise();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AppUserCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<AuthBloc>(),
        ),
      ],
      child: const Habita(),
    ),
  );
}

class Habita extends StatefulWidget {
  const Habita({super.key});

  @override
  State<Habita> createState() => _HabitaState();
}

class _HabitaState extends State<Habita> {


  void setLocale(){

  }

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) => MaterialApp(
          ////*Theme spec
          themeMode: themeProvider.currentMode,
          theme: themeProvider.currentCustomThemeLight,
          darkTheme: themeProvider.currentCustomThemeDark,
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
            if (deviceLocales != null) {
              for (final locale in deviceLocales) {
                if (supportedCodes.contains(locale.languageCode)) {
                  return locale;
                }
              }
            }
            return const Locale('en');
          },
          debugShowCheckedModeBanner: false,
          home: BlocSelector<AppUserCubit, AppUserState, bool>(
            selector: (state) {
              return state is AppUserLoggedIn;
            },
            builder: (context, isLogged) {
              if (isLogged) {
                return const PageManager();
              }
              return const LoginPage();
            },
          ),
        ),
      ),
    );
  }
}
