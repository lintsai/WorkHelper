import 'package:flutter/material.dart';
import 'package:navigation_bar/pages/group/punch.dart';
import 'package:navigation_bar/pages/home/home_friend_list.dart';
import 'package:navigation_bar/pages/home/home_user_profile.dart';
import 'package:navigation_bar/pages/work/work_action.dart';
import 'package:navigation_bar/pages/work/drawer/work_drawer_view.dart';

class WorkView extends StatefulWidget {
  const WorkView({Key? key}) : super(key: key);

  @override
  _WorkViewState createState() => _WorkViewState();
}

class _WorkViewState extends State<WorkView> {
  final List<Tab> groupTabs = WorkAction.getTabList();

  String pageName = "XXX 公司";

  @override
  Widget build(BuildContext context) {
    AppBar appBar = createAppBar();
    TabBarView tabBarView = createTabBarView();

    return DefaultTabController(
        length: groupTabs.length,
        child: Scaffold(
          appBar: appBar,
          drawer: const WorkDrawerView(),
          body: tabBarView,
        ));
  }

  AppBar createAppBar() {
    return AppBar(
      title: Text(pageName),
      bottom: TabBar(
        tabs: groupTabs,
      ),
    );
  }

  TabBarView createTabBarView() {
    return const TabBarView(
      children: <Widget>[PunchPage(), FriendListPage(), UserProfilePage()],
    );
  }
}
