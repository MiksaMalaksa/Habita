import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/settings/presentation/widgets/profile_container.dart';
import 'package:habita/src/features/settings/presentation/widgets/segmented_button.dart';

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
    final textTheme = Theme.of(context).textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.bold,
        );
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //*profile showcase
          const ProfileContainer(),
          const SizedBox(height: 20),
          //*customization
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: Text(S.of(context).customization, style: textTheme),
          ),
          const SizedBox(height: 20),
          const ThemeSelector(),
        ],
      ),
    ));
  }
}
