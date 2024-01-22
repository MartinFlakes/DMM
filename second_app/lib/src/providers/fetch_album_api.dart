import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:practicas_dos/utils/album.dart';

import 'dart:math';

Future<Album> fetchAlbum() async {
  int randomNumber = Random().nextInt(100) + 1;
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$randomNumber'),
  );

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}
