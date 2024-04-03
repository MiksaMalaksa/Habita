import 'package:flutter/material.dart';

class HabitaTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double fontSize;
  final FontWeight? weight;
  const HabitaTextButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.fontSize,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: Theme.of(context).textButtonTheme.style,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: weight ?? FontWeight.normal,
        ),
      ),
    );
  }
}
