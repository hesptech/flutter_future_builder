import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_future_builder/model/user.dart';
import 'package:http/http.dart' as http;

class UsersApi {

  static Future<List<User>> getUsers(BuildContext context) async {
    
    final url = Uri.parse("https://applicazioni-web.net/users.json");
    final response = await http.get(url);
    

    /* // Android Emulator
    final url = Uri.parse("http://10.0.2.2:80/users.json");
    final response = await http.get(url); */


    /* // localhost
    final url = Uri.parse("http://localhost:80/users.json");
    final response = await http.get(url); */


    /* final url = Uri.parse("http://127.0.0.1:80/users.json");
    final headers = {
      'Access-Control-Allow-Origin': 'http://127.0.0.1:80',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token',
      'Access-Control-Allow-Credentials': 'true',
    };
    final response = await http.get(url, headers: headers);  */
    
    
    /* 
    // ipconfig IPv4 Address (for real devices)
    final url = Uri.parse("http://192.168.0.223:80/users.json");
    
    
    // http headers
    final headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token',
      'Access-Control-Allow-Credentials': 'true',
    };
    final response = await http.get(url, headers: headers); 
    */



    /* 
    WORKING in XAMPP
    http://localhost/rhouze_db/mysqli_connect.php
    http://localhost/users.json
    http://127.0.0.1/dashboard/
    http://127.0.0.1/users.json
    http://192.168.0.223/users.json
    */
    
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