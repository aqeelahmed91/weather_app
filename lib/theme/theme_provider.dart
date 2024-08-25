import 'package:flutter/material.dart';
import 'package:weather_app/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  // Default theme
  ThemeData _themeData = lightMode;

  // Getters
  ThemeData get themeData => _themeData;
  bool get isDarkMode => themeData == darkMode;

  // Setters

  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  // toggle function
  toggleTheme() {
    if (themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
