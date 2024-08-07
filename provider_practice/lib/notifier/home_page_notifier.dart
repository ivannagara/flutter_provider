import 'package:flutter/material.dart';

class NavigationPageNotifier extends ChangeNotifier {
  int _currentNavBarIndex = 0;
  int get navBarIndex => _currentNavBarIndex;

  void setNavBarIndex(int index) {
    _currentNavBarIndex = index;
    notifyListeners();
  }

  
}
