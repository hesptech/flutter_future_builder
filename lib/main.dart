import 'package:flutter/material.dart';
import 'package:flutter_future_builder/page/user_local_page.dart';
import 'package:flutter_future_builder/page/user_network_page.dart';

void main() {
  runApp(const MyApp());
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
          currentIndex: index,
          selectedItemColor: Colors.teal,
          items: const [
            BottomNavigationBarItem(
              icon: Text('FutureBuilder'),
              label: 'Local',
            ),
            BottomNavigationBarItem(
              icon: Text('FutureBuilder'),
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
        return const UserLocalPage();
      case 1:
        return const UserNetworkPage();
      default:
        return Container();
    }
  }
}
