import 'package:chattify/src/core/ui/themes/color_palette.dart';
import 'package:chattify/src/core/ui/themes/theme_constants.dart';
import 'package:flutter/material.dart';

final lightColors = LightColors();

ThemeData get lightTheme {
  return ThemeData(
    primaryColor: lightColors.primary,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: ThemeConstants.fontFamily,
    splashColor: lightColors.primary.withOpacity(0.15),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightColors.primary,
      foregroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(lightColors.primary),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        elevation: const WidgetStatePropertyAll(4),
        shadowColor:
            WidgetStatePropertyAll(lightColors.primary.withOpacity(0.25)),
        overlayColor:
            WidgetStatePropertyAll(lightColors.primary.withOpacity(0.1)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ThemeConstants.buttonBorderRadius,
            ),
          ),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
        ),
      ),
    ),
  );
}

class LightColors implements ColorPalette {
  @override
  Color get primary => Colors.lightGreen;
}
