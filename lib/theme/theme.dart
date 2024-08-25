import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade100,
        primary: Colors.grey.shade400,
        primaryContainer: Colors.grey.shade200));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Colors.grey.shade800,
        primary: Colors.grey.shade500,
        primaryContainer: Colors.grey.shade600));
