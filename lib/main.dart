import 'package:flutter/material.dart';

import 'constants/page_constants.dart';
import 'pages/home/home.dart';
import 'pages/login.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static final routes = <String, WidgetBuilder>{
    PageConstants.loginPage: (context) => LoginPage(),
    PageConstants.homePage: (context) => HomePage(),
  };
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: LoginPage(),
    );
  }
}
