import 'package:flutter/material.dart';
import 'package:navigation/NamedRoutes.dart';
import 'package:navigation/PassArgument.dart';
import 'package:navigation/PassingData.dart';
import 'package:navigation/ReturnData.dart';
import 'HeroApp.dart';
import 'CupertinoNavigationApp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Multi-App',
      home: MultiApp(),
    );
  }
}

class MultiApp extends StatefulWidget {
  const MultiApp({super.key});

  @override
  _MultiAppState createState() => _MultiAppState();
}

class _MultiAppState extends State<MultiApp> {
  int _selectedIndex = 0;

  final List<Widget> _appScreens = [
    const HeroApp(),
    const FirstRoute(),
    const FirstScreen(),
    const HomeScreen(),
    const ReturnData(),
    const PassingData(todos: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Multi-App'),
      ),
      body: _appScreens[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Apps',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            for (int i = 0; i < _appScreens.length; i++)
              ListTile(
                title: Text('App ${i + 1}'),
                selected: _selectedIndex == i,
                onTap: () {
                  setState(() {
                    _selectedIndex = i;
                    Navigator.pop(context);
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
