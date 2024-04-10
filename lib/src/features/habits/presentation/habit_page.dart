import 'package:flutter/material.dart';

//!App bar with program name and action like edit (drop down button with edit program or habits)
//!Today(label) calendar icon button which allows to check future day and check it habits
//!The same date thing but now like a scrollable thing
//!Coontainer which tells how many habits today where done
//!habits itself
//!By tapping on their labale new screen appeared with more info and circular indicator of how much of this
//!should be done

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
