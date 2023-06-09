import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLocale = 'en';
  ThemeMode currentTheme = ThemeMode.light;


  changeCurrentLocale(String newLocale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', newLocale);
    currentLocale = newLocale;
    notifyListeners();
  }

  changeCurrentTheme(ThemeMode newTheme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme',newTheme ==  ThemeMode.light ? 'light' : 'dark');
    currentTheme = newTheme;
    notifyListeners();
  }
}