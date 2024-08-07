import 'package:flutter/material.dart';
import 'package:provider_practice/model/user.dart';

class AuthNotifier extends ChangeNotifier {
  User? _user = const User();

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  bool get isUserLoggedIn => _user != null;

  addNameWith1() {
    _user = _user?.copyWith(
      name: _user != null ? '${_user!.name}1' : '',
    );
    notifyListeners();
  }

  @override
  void dispose() {
    // Perform any cleanup operations here if necessary
    super.dispose();
  }
}
