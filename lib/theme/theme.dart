import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: Colors.teal,
    cursorColor: Colors.teal,
    selectionHandleColor: Colors.teal,
  ),
  useMaterial3: false,
  primaryColor: Colors.white,
  secondaryHeaderColor: Colors.teal,
  splashColor: Colors.teal,
  colorScheme: const ColorScheme.light(
      background: Color(0xFFEDFAFF), primary: Colors.teal),
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
    selectionColor: Colors.teal,
    cursorColor: Colors.teal,
    selectionHandleColor: Colors.teal,
  ),
  brightness: Brightness.dark,
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.teal),
  useMaterial3: false,
  primaryColor: const Color(0xFF272727),
  cardColor: Colors.white,
  splashColor: Colors.teal,
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
  colorScheme: const ColorScheme.dark(
      background: Color(0xFF272727), primary: Colors.teal),
);
