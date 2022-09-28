import 'package:bloc_networking/models/user.dart';
import 'package:bloc_networking/widgets/user_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider{

  Future<List<User>> getUsers() async {
    final url = Uri.parse('http://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if(response.statusCode == 200){
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}