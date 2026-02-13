import 'package:flutter/material.dart';

import '../page/catfact_ninja.dart';
import '../page/home_page.dart';
import '../page/user_local_page.dart';
import '../page/user_network_page.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
        _selectedIndex = index;
      if (index == 0) {
        const HomePage();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
      } else if (index == 1) {
        const UserLocalPage();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserLocalPage()));
      } else if (index == 2) {
        const UserNetworkPage();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserNetworkPage()));
      } else if (index == 3) {
        const CatfactNinja();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CatfactNinja()));
      } else if (index > 0) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black.withValues(alpha: 0.38),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal,
          items: const [
            BottomNavigationBarItem(
              icon: Text('Home', style: TextStyle(fontSize: 12)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text('FutureBuilder', style: TextStyle(fontSize: 12)),
              label: 'Local',
            ),
            BottomNavigationBarItem(
              icon: Text('FutureBuilder', style: TextStyle(fontSize: 12)),
              label: 'Network',
            ),
            BottomNavigationBarItem(
              icon: Text('FutureProvider', style: TextStyle(fontSize: 12)),
              label: 'Network',
            ),
          ],
          onTap: _onItemTapped,
        );
  }
}