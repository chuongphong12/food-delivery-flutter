import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: const Color(0xFFFE3C5B),
    primaryColorDark: const Color(0xFFFC0028),
    primaryColorLight: const Color(0xFFFE9AAA),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    fontFamily: 'Futura',
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFF1B070B),
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Color(0xFF1B070B),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Color(0xFF1B070B),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Color(0xFF1B070B),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Color(0xFF1B070B),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Color(0xFF1B070B),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF1B070B),
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF1B070B),
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFFE3C5B),
    ),
  );
}
