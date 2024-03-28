import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme.headlineSmall;
    return TextFormField(
      controller: controller,
      style: textTheme,
      //*Type of keyboard depending on hint
      keyboardType: hintText == S.of(context).email
          ? TextInputType.emailAddress
          : TextInputType.name,
      //*Deco
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          prefixIconColor: theme.iconTheme.color,
          hintText: hintText,
          hintStyle:
              textTheme!.copyWith(color: textTheme.color!.withOpacity(0.6)),
          contentPadding: const EdgeInsets.all(22)),
      //*Validation
      validator: (value) {
        //*mutual case
        if (value!.isEmpty) {
          return S.of(context).hintMissing(hintText);
        }
        //*password case
        if (hintText == S.of(context).password) {
          if (value.length < 6) {
            return S.of(context).incorrectPassword;
          }
        }
        return null;
      },
    );
  }
}
