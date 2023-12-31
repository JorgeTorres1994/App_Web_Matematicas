import 'package:flutter/material.dart';
import 'package:nueva_app_web_matematicas/services/dark_them_preferences.dart';

class DarkThemeProvider extends ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
