import 'dart:convert';
import 'package:hello_world/src/constants/keys.dart';
import 'package:hello_world/src/models/photo_model.dart';
import 'package:http/http.dart' show Client;

class PhotoService {
  Client client = Client();

  Future<Photo> getRandomPhoto() async {
    final response = await client.get(
      Uri.parse(
          'https://api.unsplash.com/photos/random/?client_id=$ACCESS_KEY'),
    );

    final body = json.decode(response.body);

    return Photo.fromJson(body);
  }
}
