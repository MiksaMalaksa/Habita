import 'package:flutter/material.dart';

class HabitPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HabitPage(),
      );
  const HabitPage({super.key});

  @override
  State<HabitPage> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Habits will be here',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
