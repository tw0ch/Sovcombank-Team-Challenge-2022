import 'dart:convert';

import 'package:stock_app/server/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<User?> getUser() async {
    var client = http.Client();

    var uri = Uri.parse(apiUrl);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
    print(response.statusCode);
    return null;
  }

  final String apiUrl = 'http://194.58.118.49/users/';

  Future<User?> postUser(Map<String, String> body) async {
    var client = http.Client();

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    final msg = jsonEncode(body);

    var uri = Uri.parse(apiUrl);
    var response = await http.post(uri, headers: headers, body: msg);

    if (response.statusCode == 200) {
      var json = response.body;
      print('success');
      return userFromJson(json);
    }
    print(response.statusCode);
    return null;
  }

  Future<User?> putUser() async {
    var client = http.Client();

    var uri = Uri.parse('http://194.58.118.49/users');
    var response = await http.put(
      Uri.parse('http://194.58.118.49/users/1'),
      body: jsonEncode(
        <String, String>{'username': 'James'},
      ),
    );

    if (response.statusCode == 200) {
      var json = response.body;
      print('success');
      print(json);
      return userFromJson(json);
    }
    print(response.statusCode);
    return null;
  }
}
