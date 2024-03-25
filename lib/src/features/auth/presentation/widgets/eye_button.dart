import 'package:flutter/material.dart';
import 'package:habita/src/features/auth/presentation/pages/signup_page.dart';

class ObscurePassword extends StatelessWidget {
  final IconData icon;
  const ObscurePassword({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.findAncestorStateOfType<SignUpState>()!.obscurePassword();
        },
        icon: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
        ));
  }
}
