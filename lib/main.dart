import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habita/src/themes/app_theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Habita());
}

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
          themeMode: themeProvider.currentMode,
          theme: themeProvider.currentCustomThemeLight,
          darkTheme: themeProvider.currentCustomThemeDark,
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var random = Random();
  List<String> allThemes = ['Main', 'Indigo', 'Purple', 'Red-Blue', 'Sakura'];

  void _incrementCounter(ThemeProvider prov) {
    setState(() {
      _counter++;
      int rand = random.nextInt(5);
      prov.setSelectedScheme(allThemes[rand]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _incrementCounter(themeProvider),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
