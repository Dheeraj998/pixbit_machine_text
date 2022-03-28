import 'package:flutter/material.dart';
import 'package:pixbit_machine_text/screens/home_page.dart';
import 'package:pixbit_machine_text/screens/landing_page.dart';
import 'package:pixbit_machine_text/screens/sign_in_screen.dart';
import 'package:pixbit_machine_text/screens/user_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LandingPage(),
      routes: {
        SignInScreen.RouteName: (context) => SignInScreen(),
        HomePage.RouteName: (context) => HomePage(),
        UserDetailPage.RouteName: (context) => UserDetailPage()
      },
    );
  }
}
