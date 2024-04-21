import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:habita/generated/l10n.dart';

class HabitTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool requireCheck;
  final VoidCallback onSubmitted;
  final int? maxChars;

  const HabitTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSubmitted,
    this.maxChars,
    this.requireCheck = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onSubmitted,
      controller: controller,
      maxLength: maxChars ?? 15,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Iconic.cancel,
            color: Theme.of(context).primaryColorLight,
          ),
          onPressed: () => controller.clear(),
        ),
        hintText: hintText,
      ),
      validator: (value) {
        if (requireCheck) {
          if (value!.isEmpty || value.trim().isEmpty) {
            return S.of(context).invalidInput;
          }
        }

        return null;
      },
    );
  }
}
