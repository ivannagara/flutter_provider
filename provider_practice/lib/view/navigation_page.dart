import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/notifier/home_page_notifier.dart';
import 'package:provider_practice/view/profile_page.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});

  final List<Widget> _listOfPages = [
    const Text('Home Page'),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationPageNotifier(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(),
          body: _listOfPages[
              Provider.of<NavigationPageNotifier>(context).navBarIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex:
                Provider.of<NavigationPageNotifier>(context).navBarIndex,
            selectedItemColor: Colors.amber[800],
            onTap: context.read<NavigationPageNotifier>().setNavBarIndex,
          ),
        );
      },
    );
  }
}
