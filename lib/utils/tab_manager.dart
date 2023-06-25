import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int selectedTab = 0;
  bool _isLoggedIn = false;

  void goToTab(index) {
    selectedTab = index;
    notifyListeners();
  }

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;
}
