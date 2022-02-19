import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';
import 'package:navigation_bar/pages/settings/company/list/company_list_view.dart';
import 'package:navigation_bar/pages/settings/company/setting/company_setting_view.dart';
import 'package:navigation_bar/pages/settings/friend/friend_view.dart';
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
    PageConstants.personalSettingView: (context) => const PersonalSettingView(),
    PageConstants.friendView: (context) => const FriendView(),
    PageConstants.companyListView: (context) => const CompanyListView(),
  };
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    I18nUtil.initI18n();
    return MaterialApp(
      routes: routes,
      home: const WorkView(),
      initialRoute: PageConstants.workPage,
    );
  }
}
