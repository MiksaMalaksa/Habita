import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: LinearGradient(colors: [
              theme.colorScheme.primary.green > 100
                  ? theme.colorScheme.primary.withGreen(78)
                  : theme.colorScheme.primary,
              theme.colorScheme.primaryContainer
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            S.of(context).submit,
            style: theme.textTheme.headlineLarge!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        )),
      ),
    );
  }
}
