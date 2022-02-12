import 'package:flutter/material.dart';
import 'package:navigation_bar/pages/settings/personal/personal_setting_view.dart';
import 'package:navigation_bar/pages/work/work_view.dart';

import 'constants/page_constants.dart';
import 'pages/home/home.dart';
import 'pages/login/login.dart';
import 'pages/group/group_front.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static final routes = <String, WidgetBuilder>{
    PageConstants.loginPage: (context) => const LoginPage(),
    PageConstants.homePage: (context) => const HomePage(),
    PageConstants.devPage: (context) => const GroupFrontPage(),
    PageConstants.workPage: (context) => const WorkView(),
    PageConstants.personalSettingPage: (context) => const PersonalSettingView(),
  };
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: const WorkView(),
      initialRoute: PageConstants.workPage,
    );
  }
}
