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
  static const List homeSubPage = [ChatPage(), FriendListPage(), UserProfilePage()];
  int homeSubPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeSubPage[homeSubPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_left),
            label: "聊天",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_left),
            label: "好友",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_right_alt),
            label: "個人資訊",
          ),
        ],
        onTap: (index) {
          setState(() {
            homeSubPageIndex = index;
          });
        },
      ),
    );
  }
}
