import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pixbit_machine_text/screens/user_detail_page.dart';
import 'package:http/http.dart' as http;

class User extends StatefulWidget {
  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  var users;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('http://training.pixbitsolutions.com/users.php'));
    users = jsonDecode(response.body) as Map<String, dynamic>;
    setState(() {});
    print(users);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
          Navigator.pushNamed(context, UserDetailPage.RouteName);
        }),
        child: ListTile(leading: CircleAvatar(), title: Text('Angelina')));
  }
}
