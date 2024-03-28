import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const StatsPage(),
      );
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Stats will be here',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
