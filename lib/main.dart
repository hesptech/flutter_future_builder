import 'package:flutter/material.dart';
import 'package:flutter_future_builder/page/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_future_builder/page/user_local_page.dart';
import 'package:flutter_future_builder/page/user_network_page.dart';
import 'package:flutter_future_builder/page/catfact_ninja.dart';

void main() {

  runApp(
    const ProviderScope(
      child: MyApp()
    ) 
  );
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const String title = 'Future Builder & Json';

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MainPage(title: title),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, 
    required this.title,
  });

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black.withOpacity(0.38),
          currentIndex: index,
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
          onTap: (int index) => setState(() => this.index = index),
        ),
        body: buildPages(),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const UserLocalPage();
      case 2:
        return const UserNetworkPage();
      case 3:
        return const CatfactNinja();
      default:
        return Container();
    }
  }
}
