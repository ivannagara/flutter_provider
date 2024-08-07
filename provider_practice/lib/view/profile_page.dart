import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/notifier/auth_notifier.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Selector<AuthNotifier, String?>(
              selector: (context, authNotifier) => authNotifier.user?.name,
              builder: (context, name, child) {
                return Text(name ?? '');
              },
            ),
            Selector<AuthNotifier, String?>(
              selector: (context, authNotifier) => authNotifier.user?.id,
              builder: (context, id, child) {
                return Text(id ?? '');
              },
            ),
            Selector<AuthNotifier, String?>(
              selector: (context, authNotifier) =>
                  authNotifier.user?.description,
              builder: (context, description, child) {
                return Text(description ?? '');
              },
            ),
            const Text('12 Years Old'),
            ElevatedButton(
              onPressed: () {
                Provider.of<AuthNotifier>(context, listen: false)
                    .addNameWith1();
              },
              child: const Text('Add 1'),
            ),
          ],
        ),
      ),
    );
  }
}
