import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';

class AppTheme{
  static final Color _primaryColor = const Color(0xFF47BA80);
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _primaryColor,
    colorScheme: ColorScheme.light(
      primary: _primaryColor,
      primaryContainer: _primaryColor.withValues(alpha: 80),
      surface: Colors.white,
      error: const Color(0xFFD32F2F),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
    ),
    fontFamily: AppFonts.inter,
  );


}
