import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/notifier/auth_notifier.dart';
import 'package:provider_practice/notifier/login_page_notifier.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginPageNotifier(),
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            _usernameFocusNode.unfocus();
            _pwdFocusNode.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Selector<LoginPageNotifier, String?>(
                    selector: (_, notifier) => notifier.username,
                    builder: (context, username, child) {
                      return TextFormField(
                        focusNode: _usernameFocusNode,
                        initialValue: username,
                        onChanged: (value) {
                          Provider.of<LoginPageNotifier>(context, listen: false)
                              .setUsername(value);
                        },
                        decoration:
                            const InputDecoration(labelText: 'Username'),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Selector<LoginPageNotifier, String?>(
                    selector: (_, notifier) => notifier.password,
                    builder: (context, password, child) {
                      return TextFormField(
                        initialValue: password,
                        focusNode: _pwdFocusNode,
                        obscureText: true,
                        onChanged: (value) {
                          Provider.of<LoginPageNotifier>(context, listen: false)
                              .setPassword(value);
                        },
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Selector<LoginPageNotifier, bool>(
                    selector: (_, notifier) => notifier.isValid,
                    builder: (context, isValid, child) {
                      return ElevatedButton(
                        onPressed: isValid
                            ? () {
                                context.read<AuthNotifier>().login(
                                      context
                                          .read<LoginPageNotifier>()
                                          .username,
                                      context
                                          .read<LoginPageNotifier>()
                                          .password,
                                    );
                              }
                            : null,
                        child: const Text('Login'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
