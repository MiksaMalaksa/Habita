import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      dismissDirection: DismissDirection.down,
        content: Text(
      content,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 14),
    )));
}
