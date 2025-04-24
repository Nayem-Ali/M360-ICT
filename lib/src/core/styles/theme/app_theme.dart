import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF47BA80),
    colorScheme: ColorScheme.light(
      primary: Color(0xFF47BA80),
      secondary: Color(0xFFA1FFD0),
      surface: Colors.white,
    ),
  );
}