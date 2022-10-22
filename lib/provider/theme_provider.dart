import 'package:flutter/material.dart';
import 'package:new_tester/theme/dark_theme.dart';
import 'package:new_tester/theme/light_theme.dart';

enum ThemeEnum {
  dark('dark'),
  light('light');

  final String name;
  const ThemeEnum(this.name);
}

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = MyLightTheme.theme;

  void toogleTheme({required ThemeEnum theme}) {
    if (ThemeEnum.light.name == theme.name) {
      currentTheme = MyLightTheme.theme;
    } else {
      currentTheme = MyDarkTheme.theme;
    }
    notifyListeners();
  }
}
