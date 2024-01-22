import 'package:flutter/material.dart';
import 'package:practicas_dos/src/pages/navigation/practica_uno/datil_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Main Screen'),
      // ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DetailScreen();
          }));
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://yt3.googleusercontent.com/ZVRLcVugHPiEZYOwC-uYPnIK2z32yl75HlMdOCPgC6kq5jdYDG-2wboc57JEDT4V-8as2olanu8=s900-c-k-c0x00ffffff-no-rj',
          ),
        ),
      ),
    );
  }
}