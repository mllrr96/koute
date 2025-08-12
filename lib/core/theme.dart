import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightSurfaceColor = Color(0xFF111111);
  static const Color lightTextColor = Color(0xFF111111);
  static const Color lightDividerColor = Color(0xFFF2F2F2);

  static const Color darkBackgroundColor = Color(0xFF111111);
  static const Color darkSurfaceColor = Color(0xFF1E1E1E);
  static const Color darkTextColor = Color(0xFFFFFFFF);
  static const Color darkDividerColor = Color(0xFF2A2A2A);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightSurfaceColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    colorScheme: const ColorScheme.light(
      primary: lightSurfaceColor,
      secondary: lightBackgroundColor,
      surface: lightSurfaceColor,
      onPrimary: lightBackgroundColor,
      onSecondary: lightTextColor,
      onSurface: lightBackgroundColor,
      error: Colors.redAccent,
      onError: Colors.white,
    ),
    textTheme: _textTheme(lightTextColor),
    appBarTheme: AppBarTheme(
      backgroundColor: lightBackgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: lightTextColor),
      titleTextStyle: _textTheme(lightTextColor).headlineMedium,
    ),
    cardTheme: CardThemeData(
      color: lightSurfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    dividerColor: lightDividerColor,
    iconTheme: const IconThemeData(color: lightTextColor),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: lightBackgroundColor,
      elevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkSurfaceColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    colorScheme: const ColorScheme.dark(
      primary: darkSurfaceColor,
      secondary: darkBackgroundColor,
      surface: darkSurfaceColor,
      onPrimary: darkTextColor,
      onSecondary: darkTextColor,
      onSurface: darkTextColor,
      error: Colors.redAccent,
      onError: Colors.white,
    ),
    textTheme: _textTheme(darkTextColor),
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: darkTextColor),
      titleTextStyle: _textTheme(darkTextColor).headlineMedium,
    ),
    cardTheme: CardThemeData(
      color: darkSurfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    dividerColor: darkDividerColor,
    iconTheme: const IconThemeData(color: darkTextColor),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: darkBackgroundColor,
      elevation: 0,
    ),
  );

  static TextTheme _textTheme(Color color) {
    return TextTheme(
      displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 57, fontWeight: FontWeight.bold, color: color),
      displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 45, fontWeight: FontWeight.bold, color: color),
      displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 36, fontWeight: FontWeight.bold, color: color),
      headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 32, fontWeight: FontWeight.bold, color: color),
      headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 28, fontWeight: FontWeight.bold, color: color),
      headlineSmall: GoogleFonts.playfairDisplay(
          fontSize: 24, fontWeight: FontWeight.bold, color: color),
      titleLarge: GoogleFonts.manrope(
          fontSize: 22, fontWeight: FontWeight.bold, color: color),
      titleMedium: GoogleFonts.manrope(
          fontSize: 16, fontWeight: FontWeight.w600, color: color),
      titleSmall: GoogleFonts.manrope(
          fontSize: 14, fontWeight: FontWeight.w600, color: color),
      bodyLarge: GoogleFonts.manrope(fontSize: 16, color: color),
      bodyMedium: GoogleFonts.manrope(fontSize: 14, color: color),
      bodySmall: GoogleFonts.manrope(fontSize: 12, color: color),
      labelLarge: GoogleFonts.manrope(
          fontSize: 14, fontWeight: FontWeight.bold, color: color),
      labelMedium: GoogleFonts.manrope(
          fontSize: 12, fontWeight: FontWeight.bold, color: color),
      labelSmall: GoogleFonts.manrope(
          fontSize: 11, fontWeight: FontWeight.bold, color: color),
    );
  }
}
