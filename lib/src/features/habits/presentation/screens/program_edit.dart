import 'package:flutter/material.dart';

class ProgramEdit extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ProgramEdit());
  const ProgramEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Info will be there'),
      ),
    );
  }
}
