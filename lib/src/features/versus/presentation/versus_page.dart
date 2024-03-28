import 'package:flutter/material.dart';

class VersusPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const VersusPage(),
      );
  const VersusPage({super.key});

  @override
  State<VersusPage> createState() => _VersusPageState();
}

class _VersusPageState extends State<VersusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Versus will be here',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
