import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            S.of(context).alertLogout,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          content: Text(S.of(context).wantToLogOut),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              style: Theme.of(context).textButtonTheme.style,
              child: Text(
                S.of(context).no,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: Theme.of(context).textButtonTheme.style,
              child: Text(
                S.of(context).yes,
              ),
            ),
          ],
        );
      });
}
