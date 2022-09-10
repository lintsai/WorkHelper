import 'package:flutter/material.dart';
import 'package:navigation_bar/pages/home/home_chat.dart';
import 'package:navigation_bar/pages/home/home_friend_list.dart';
import 'package:navigation_bar/pages/home/home_user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int groupPageIndex = 0;

  final List<Tab> groupTabs = <Tab>[
    const Tab(
      text: "上班打卡",
    ),
    const Tab(
      text: "請假加班",
    ),
    const Tab(
      text: "訊息通知",
    ),
  ];

  String pageName = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: groupTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(pageName),
            bottom: TabBar(
              tabs: groupTabs,
            ),
          ),
          drawer: Drawer(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: const Text(
                      "GFG",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text("List item $index"),
                    onTap: () {
                      drawItemClick(context);
                    },
                  );
                }),
          ),
          body: const TabBarView(
            children: <Widget>[ChatPage(), FriendListPage(), UserProfilePage()],
          ),
        ));
  }

  void drawItemClick(BuildContext context) {
    setState(() {
      Navigator.of(context).pop();
    });
  }
}
