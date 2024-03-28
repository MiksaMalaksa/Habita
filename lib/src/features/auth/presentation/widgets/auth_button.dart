import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onTap;
  const AuthButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        //!Give it texture!
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context)
                    .scaffoldBackgroundColor
                    .elevateAllColors(upParam: 10, opacity: 0.9),
                style: BorderStyle.solid,
                width: 2),
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
