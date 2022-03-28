import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pixbit_machine_text/api/login.dart';
import 'package:pixbit_machine_text/screens/home_page.dart';

class SignInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  static const RouteName = '/sign-in';
  Future<Login> loginMethod(String email, String password) async {
    var res = await http.post(
        Uri.parse('http://training.pixbitsolutions.com/login.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": email, "password": password}));
    print('res : ${res.body}');

    if (res.statusCode == 200) {
      return Login.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 270,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      final emailText = _emailController.text;
                      final passwordText = _emailController.text;
                      // loginMethod(emailText, passwordText);
                      Navigator.pushNamed(context, HomePage.RouteName);
                    },
                    child: Text('Sign In'))),
          ],
        ),
      )),
    );
  }
}
