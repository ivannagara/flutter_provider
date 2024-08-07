import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider_practice/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  AuthNotifier() {
    _loadUserFromPrefs();
  }

  Future<void> _loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');
    if (userData != null) {
      _user = User.fromJson(json.decode(userData));
      notifyListeners();
    }
  }

  Future<void> _saveUserToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(_user?.toJson()));
  }

  Future<void> _removeUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  bool get isUserLoggedIn => _user != null;

  void addNameWith1() {
    _user = _user?.copyWith(
      name: _user != null ? '${_user!.name}1' : '',
    );
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    _user = User(
      id: ((Random().nextDouble()) * 123456789).toString(),
      name: 'John Doe',
      description: 'The only one and the marvelous Johny Doe',
      email: username,
    );
    notifyListeners();
    await _saveUserToPrefs();
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
    await _removeUserFromPrefs();
  }

  @override
  void dispose() {
    print('disposeee');
    super.dispose();
  }
}
