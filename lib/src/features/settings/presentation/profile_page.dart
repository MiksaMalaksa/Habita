import 'package:flutter/material.dart';
import 'package:habita/src/features/settings/presentation/widgets/profile_container.dart';

class ProfilePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      );
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      padding:  EdgeInsets.all(10),
      child: Column(
        children: [
          ProfileContainer()
        ],
      ),
    ));
  }
}

