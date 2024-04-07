import 'package:flutter/material.dart';
import 'package:habita/core/common/entities/dialog.dart';

Future<void> dialogBuilder({
  required BuildContext context,
  required DialogAtributes atributes,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          titleTextStyle: Theme.of(context).textTheme.headlineMedium,
          title: Text(atributes.label),
          content: Text(
            atributes.body,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          actions: atributes.actions);
    },
  );
}
