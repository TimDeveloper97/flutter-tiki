import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;
}

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black87,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
);

const TextStyle headline1 =
    TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle headline2 =
    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle headline3 =
    TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle bodyText1 = TextStyle(fontSize: 14.0, color: Colors.black54);
const TextStyle bodyText2 = TextStyle(fontSize: 12.0, color: Colors.black54);
const TextStyle subtitle1 = TextStyle(fontSize: 10.0, color: Colors.grey);
