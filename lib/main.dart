import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/auth/presentation/pages/login_page.dart';
import 'package:habita/src/themes/app_theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Habita());
}

//!first of all settings screen -> signs -> bottom bar
//!init -> didChangeDep(sub to inh) --> (delete from widget tree) --> deactivated then it can be disposed or back

class Habita extends StatefulWidget {
  const Habita({super.key});

  @override
  State<Habita> createState() => _HabitaState();
}

class _HabitaState extends State<Habita> {
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