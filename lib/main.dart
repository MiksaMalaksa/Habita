import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habita/core/supabase_keys/supa_keys.dart';
import 'package:habita/generated/l10n.dart';
//import 'package:habita/init_dependencies.dart';
import 'package:habita/src/features/auth/data/data_sources/auth_datasource_impl.dart';
import 'package:habita/src/features/auth/data/repositories/auth_remo_impl.dart';
import 'package:habita/src/features/auth/domain/usecases/signup_usecase.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/auth/presentation/pages/login_page.dart';
import 'package:habita/src/themes/app_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialise();
  final supabase = await Supabase.initialize(
      url: SupabaseKeys.supaUrl, anonKey: SupabaseKeys.supaAnonKey);

  runApp(MultiBlocProvider(providers: [
    Provider(
        create: (_) => AuthBloc(
            userSignUp: UserSignUp(
                repository: AuthRepoImpl(
                    datasource: AuthDatasourceImpl(client: supabase.client)))))
  ], child: const MyApp()));
}

//!first of all settings screen -> signs -> bottom bar
//!init -> didChangeDep(sub to inh) --> (delete from widget tree) --> deactivated then it can be disposed or back

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          //!change for backend priority
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
          home: const LoginPage(),
        ),
      ),
    );
  }
}
