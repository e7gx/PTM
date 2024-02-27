import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: false,
  primaryColor: Colors.white,
  secondaryHeaderColor: Colors.cyan,
  splashColor: Colors.cyan,
  colorScheme: const ColorScheme.light(background: Color(0xFFEDFAFF)),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontFamily: 'Cario',
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontFamily: 'Cario',
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  ),
);
ThemeData darkMode = ThemeData(
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.cyan,
    selectionColor: Colors.cyan,
  ),
  brightness: Brightness.dark,
  useMaterial3: false,
  primaryColor: const Color(0xFF272727),
  cardColor: Colors.white,
  splashColor: Colors.cyan,
  hintColor: Colors.black,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontFamily: 'Cario',
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontFamily: 'Cario',
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  ),
  colorScheme: const ColorScheme.dark(background: Color(0xFF272727)),
);
