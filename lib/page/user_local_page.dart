import 'package:flutter/material.dart';
import 'package:flutter_future_builder/api/users_api.dart';
import 'package:flutter_future_builder/model/user.dart';


class UserLocalPage extends StatelessWidget {
  const UserLocalPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: FutureBuilder<List<User>>(
      //future: UsersApi.getUsersLocally(context),
      future: UsersApi.getUsers(context),
      builder: (context, snapshot) {
        final users = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator(),);
          default:
            if(snapshot.hasError) {
              return const Center(child: Text('Some error ocurred!'),);
            } else {
              return buildUsers(users!);
            }
        }
      },
    ),
  );

  Widget buildUsers(List<User> users) => ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: users.length,
    itemBuilder: (context, index) {
      final user = users[index];

      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.urlAvatar),
        ),
        title: Text(user.username),
        subtitle: Text(user.email),
      );
    },
  );
}