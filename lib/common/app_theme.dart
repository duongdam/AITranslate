import 'package:flutter/material.dart';

bool? isDarkMode;

class AppTheme {
  static initialize(bool? isDark) {
    isDarkMode = isDark;
  }

  static ThemeMode get themeMode {
    return isDarkMode == null
        ? ThemeMode.system
        : isDarkMode!
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.standard,
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.standard,
      );
}
