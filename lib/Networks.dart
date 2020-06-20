import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Models/modell.dart';

class Network {
  Future<Modell> certainService(String url) async {
    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Modell data = Modell.fromJson(json.decode(response.body));
      return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
