import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UsersProvider {
  Future<List<User>> getUsers() async {
    Uri url = Uri.https('jsonplaceholder.typicode.com', '/users');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> usersJson = jsonDecode(response.body);
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching user');
    }
  }
}
