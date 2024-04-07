import 'package:flutter/material.dart';

class DialogAtributes {
  final String label;
  final String body;
  final List<Widget>? actions;

  DialogAtributes({
    required this.label,
    required this.body,
    this.actions,
  });
}
