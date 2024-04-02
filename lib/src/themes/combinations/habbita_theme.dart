import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:habita/core/constants/font_family.dart';

//*Habita bright pink & yellow colors
final habitaColoringLight = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color.fromARGB(255, 247, 72, 119),
    primaryContainer: Color.fromARGB(255, 255, 210, 118),
    secondary: Color.fromARGB(255, 247, 182, 212),
    secondaryContainer: Color.fromARGB(255, 252, 224, 247),
    tertiary: Color.fromARGB(255, 255, 247, 118),
    tertiaryContainer: Color.fromARGB(255, 252, 247, 224),
    appBarColor: Color.fromARGB(255, 247, 224, 252),
    error: Color.fromARGB(255, 247, 166, 72),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  fontFamily: textTheme,
);

final habitaColoringDark = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color.fromARGB(255, 229, 195, 210),
    primaryContainer: Color.fromARGB(255, 232, 207, 64),
    secondary: Color.fromARGB(255, 208, 157, 179),
    secondaryContainer: Color.fromARGB(255, 231, 207, 218),
    tertiary: Color.fromARGB(255, 226, 219, 148),
    tertiaryContainer: Color.fromARGB(255, 231, 225, 207),
    appBarColor: Color.fromARGB(255, 231, 207, 225),
    error: Color.fromARGB(255, 208, 176, 116),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 10,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  fontFamily: textTheme,
);
