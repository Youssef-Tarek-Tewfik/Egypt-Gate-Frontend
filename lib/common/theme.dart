import 'package:flutter/material.dart';

class CustomColors {
  static const Color primary = Colors.yellow;
  static const Color secondary = Colors.black;
  static Color third = Colors.yellow.shade300;
  static const Color fourth = Color.fromRGBO(56, 37, 14, 20);
}

ThemeData customThemeData() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: CustomColors.primary,
  );
}