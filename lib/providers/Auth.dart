import 'dart:convert';

import 'package:auth/Authorization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/User.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  final _storage = const FlutterSecureStorage();
// NOTE : This project didnt finish yet this is not the final result of it
//please Make sure that Node Auth on my github is up and running and change the ip to your Host machine ip
  Future<void> SignUp(Map<String, dynamic> user) async {
    const url = 'http://10.10.10.206:4000/SignUp';
    await http.put(
      Uri.parse(url),
      headers: {
        'method': 'PUT',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
  }
  // NOTE : This project didnt finish yet this is not the final result of it
//please Make sure that Node Auth on my github is up and running and change the ip to your Host machine ip

  Future<void> Signin(String email, String password) async {
    const url = 'http://10.10.10.206:4000/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'method': 'POST',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );
    final exctractedata = jsonDecode(response.body) as Map<String, dynamic>;

    await Authorization.setToken(exctractedata["token"]);
  }

  Future<void> logOut() async {
    print("it works");
    await Authorization.setToken("");
  }
}
