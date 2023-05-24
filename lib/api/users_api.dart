import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_future_builder/model/user.dart';
import 'package:http/http.dart' as http;

class UsersApi {

  static Future<List<User>> getUsers(BuildContext context) async {
    final url = Uri.parse("https://applicazioni-web.net/users.json");
    final response = await http.get(url);
    
    final body = json.decode(response.body);

    return body.map<User>(User.fromJson).toList(); 
  }


  static Future<List<User>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/users.json');
    final body = json.decode(data);

    return body.map<User>(User.fromJson).toList(); 
  }
}