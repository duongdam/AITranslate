import 'package:flutter/cupertino.dart';


class GlobalState extends ChangeNotifier {
  /// Todo: for dark mode theme
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}


