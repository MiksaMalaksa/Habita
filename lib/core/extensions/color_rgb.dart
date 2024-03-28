import 'package:flutter/material.dart';

extension ThemeExtension on Color {
  Color elevateAllColors({required int upParam, double opacity = 1.0}) {
    return withBlue(blue + upParam)
        .withGreen(green + upParam)
        .withRed(red + upParam)
        .withOpacity(opacity);
  }
}
