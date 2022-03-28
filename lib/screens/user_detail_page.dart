import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDetailPage extends StatefulWidget {
  static const RouteName = '/user-detail';

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              title:
                  Text(users != null ? users['data'][1]['name'] : 'angelina'),
              background: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fill,
              ),
            ),
            actions: [
              Icon(Icons.edit),
              Icon(Icons.more_vert),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                leading: Icon(
                  Icons.call,
                ),
                title: Text(
                    users != null ? users['data'][1]['phone'] : '823975239875'),
                subtitle: Text('mobile'),
                trailing: Icon(Icons.message),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text('823975239875'),
                subtitle: Text('work'),
                trailing: Icon(Icons.message),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.mail),
                title: Text('gmail.com'),
                subtitle: Text('personal'),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text('sdsd@gmail.com'),
                subtitle: Text('work'),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
