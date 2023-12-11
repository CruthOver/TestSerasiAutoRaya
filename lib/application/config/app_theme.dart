import 'package:flutter/material.dart';
import 'package:test_serasi_raya/application/config/app_color.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: greyColor, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: greenColor, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      focusColor: greenColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        foregroundColor: Colors.white,
        backgroundColor: greenColor,
        padding: const EdgeInsets.symmetric(
          vertical: 18.0,
        ),
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: greenColor,
      onPrimary: Colors.black,
      secondary: Colors.black,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.blueGrey,
      onSurface: Colors.black,
    ),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
