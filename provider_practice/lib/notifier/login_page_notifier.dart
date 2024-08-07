import 'package:flutter/material.dart';

class LoginPageNotifier extends ChangeNotifier {
  String _username = '';
  String _password = '';
  bool _isValid = false;

  String get username => _username;
  String get password => _password;
  bool get isValid => _isValid;

  void setUsername(String username) {
    _username = username;
    print(_username);
    _checkIsValid();
  }

  void setPassword(String password) {
    _password = password;
    print(password);
    _checkIsValid();
  }
  
  void _checkIsValid() {
    if (!_isValidEmail(_username) || _password.length < 6) {
      _isValid = false;
    } else {
      _isValid = true;
    }
    notifyListeners();
    return;
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}
