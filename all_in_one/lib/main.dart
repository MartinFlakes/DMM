import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const CombinedApp());

class CombinedApp extends StatelessWidget {
  const CombinedApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Combined App';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: const CombinedHomePage(title: appTitle),
    );
  }
}

class CombinedHomePage extends StatefulWidget {
  final String title;

  const CombinedHomePage({super.key, required this.title});

  @override
  State<CombinedHomePage> createState() => _CombinedHomePageState();
}

class _CombinedHomePageState extends State<CombinedHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> getWidgetOptions(BuildContext context) {
    return [
      Center(
        child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text('Yay! A SnackBar!'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Show SnackBar'),
        ),
      ),
      // OrientationList(title: 'Orientation Demo'), // Commented out the invalid code
      const Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      const Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      const CustomFontsPage(),
      // MyHomePage(title: 'Custom Themes'), // Commented out the invalid code
      const CustomFontsPage(), // Agregado el proyecto Custom Fonts nuevamente
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = getWidgetOptions(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: widgetOptions[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('SnackBar Demo'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Orientation Demo'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Custom Fonts'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Custom Themes'),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Custom Fonts Again'),
              selected: _selectedIndex == 6,
              onTap: () {
                _onItemTapped(6);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFontsPage extends StatelessWidget {
  const CustomFontsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Fonts')),
      body: const Center(
        child: Text(
          'Roboto Mono sample',
          style: TextStyle(fontFamily: 'RobotoMono'),
        ),
      ),
    );
  }
}
