import 'package:flutter/material.dart';

class CustomColors {
  static Color primary = Colors.yellow.shade300;
  static const Color secondary = Colors.black;
  static const Color third = Colors.black;
}

ThemeData customThemeData() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: CustomColors.primary,
  );
}