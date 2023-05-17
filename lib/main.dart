import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/NavPages/home_page.dart';
import 'package:gb_tour/View/Screens/Profile/profile_page.dart';
import 'package:gb_tour/View/Screens/animated_splash.dart';
import 'package:gb_tour/View/Screens/detail_page.dart';
import 'package:gb_tour/View/Screens/welcome.dart';
import 'View/Screens/Login.dart';
import 'View/Screens/NavPages/main_page.dart';
import 'View/Screens/destinations.dart';
import 'View/Screens/sign_up.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SignupScreen(),
    );
  }
}
