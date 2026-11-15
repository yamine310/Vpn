import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF081426);
  static const Color surface = Color(0xFF11233D);
  static const Color primary = Color(0xFF19B5FE);
  static const Color success = Color(0xFF20D6A1);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: success,
      surface: surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      centerTitle: false,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: surface,
      indicatorColor: Color(0xFF23466D),
    ),
  );
}