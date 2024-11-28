import 'package:flutter/material.dart';

const Color orangeClr = Color.fromARGB(255, 219, 89, 14);
const Color blueClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color whites = Colors.white;
const Color darkcClr = Color(0xFF121212);
const Color greyClr = Color(0xFF424242);
const Color PurpClr = Colors.deepPurple;

const primaryClr = orangeClr;

final light = ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.light,
    textTheme: const TextTheme());

final dark = ThemeData(
  primarySwatch: Colors.deepPurple,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.deepPurple),
  brightness: Brightness.dark,
);
