import 'package:flutter/material.dart';
import 'package:provider_practice/notifier/auth_notifier.dart';
import 'package:provider_practice/view/main_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthNotifier(),
          key: const ValueKey('authNotifier'),
        ),
      ],
      child: const MainApp(),
    ),
  );
}
