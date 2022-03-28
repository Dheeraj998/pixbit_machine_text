import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pixbit_machine_text/screens/sign_in_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
              radius: 100,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'DriverEx',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInScreen.RouteName);
                  },
                  child: Text('Sign In')),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 300,
                height: 40,
                child:
                    ElevatedButton(onPressed: () {}, child: Text('Register'))),
            const SizedBox(
              height: 100,
            ),
            Text(
              'Take Tour',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            )
          ],
        ),
      )),
    );
  }
}
