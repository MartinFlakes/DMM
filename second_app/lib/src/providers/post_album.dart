import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:practicas_dos/utils/album.dart';

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
  
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
   
    throw Exception('Failed to create album.');
  }
}
