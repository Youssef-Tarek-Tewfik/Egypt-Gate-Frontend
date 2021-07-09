import 'package:flutter/material.dart';

class CustomColors {
  static const Color primary = Color(0xFFEFD79B);
  static const Color secondary = Colors.black;
  static const Color third = Color.fromRGBO(56, 37, 14, 20);
  // static Color fourth = Colors.yellow.shade300;
  // static final ThemeData themeData = customThemeData();
}

ThemeData customThemeData() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: CustomColors.primary,
    colorScheme: ColorScheme(
      primary: CustomColors.primary,
      primaryVariant: CustomColors.primary,
      secondary: CustomColors.third,
      secondaryVariant: CustomColors.third,
      surface: Colors.white,
      background: CustomColors.primary,
      error: CustomColors.third,
      onPrimary: Colors.white,
      onSecondary: CustomColors.primary,
      onSurface: Colors.black,
      onBackground: CustomColors.third,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
  );
}