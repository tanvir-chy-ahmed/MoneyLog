import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;// make it light

  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.light;  // make it dark

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    debugPrint('Theme changed to $mode');
    notifyListeners();
  }
}
