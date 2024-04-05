import 'package:flutter/material.dart';

class HabitaGreet extends StatelessWidget {
  const HabitaGreet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 71, 119),
      body: Center(
        child: Image.asset(
          'assets/habita_logo.png',
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }
}
