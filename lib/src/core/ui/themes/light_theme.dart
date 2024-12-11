import 'package:flutter/material.dart';

ThemeData get lightTheme {
  return ThemeData(
    primaryColor: Colors.lightGreen,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'OpenSans',
    splashColor: Colors.lightGreen.withOpacity(0.15),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.lightGreen,
      foregroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
  );
}
