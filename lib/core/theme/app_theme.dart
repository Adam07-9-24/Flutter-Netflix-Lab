import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xFF090909);
  static const surface = Color(0xFF171717);
  static const surfaceHigh = Color(0xFF242424);
  static const red = Color(0xFFE50914);
  static const white = Color(0xFFF7F7F7);
  static const muted = Color(0xFFB3B3B3);
  static const success = Color(0xFF46D369);
}

abstract final class AppTheme {
  static ThemeData get dark {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.red,
      brightness: Brightness.dark,
      surface: AppColors.surface,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'BebasNeue',
          fontSize: 52,
          height: .9,
          letterSpacing: 1.2,
          color: AppColors.white,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          color: AppColors.white,
          height: 1.45,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          color: AppColors.muted,
          height: 1.45,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surface,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        elevation: 2,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.surfaceHigh,
        contentTextStyle: TextStyle(
          fontFamily: 'Poppins',
          color: AppColors.white,
        ),
        behavior: SnackBarBehavior.floating,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceHigh,
        hintStyle: const TextStyle(color: AppColors.muted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
