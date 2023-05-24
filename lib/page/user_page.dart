import 'package:flutter/material.dart';
import 'package:flutter_future_builder/model/user.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(user.username),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(user.urlAvatar),
            radius: 80,
          ),
          const SizedBox(height: 40.0,),
          Text(
            user.username,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 64.0,),
          const MaterialButton(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
            color: Colors.teal,
            onPressed: null,
            child: Text('Send mail'),
          )
        ],
      ),
    ),
  );
}