import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff212224),
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w200),
    ),
  );
}

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffd6d6d6),
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w200),
    ),
  );
}