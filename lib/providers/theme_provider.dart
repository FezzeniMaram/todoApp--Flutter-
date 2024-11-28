import 'package:flutter/material.dart';

import '../constants/Theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData theme = light;
  bool isDarkMode = false;
  changeTheme() {
    if (isDarkMode) {
      theme = light;
    } else {
      theme = dark;
    }
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
