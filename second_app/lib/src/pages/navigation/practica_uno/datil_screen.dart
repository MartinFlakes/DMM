import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://yt3.googleusercontent.com/ZVRLcVugHPiEZYOwC-uYPnIK2z32yl75HlMdOCPgC6kq5jdYDG-2wboc57JEDT4V-8as2olanu8=s900-c-k-c0x00ffffff-no-rj',
            ),
          ),
        ),
      ),
      
    );
  }
}