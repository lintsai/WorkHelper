import 'package:flutter/material.dart';
import 'package:navigation_bar/pages/group/attendance_management.dart';
import 'package:navigation_bar/pages/group/punch.dart';
import 'package:navigation_bar/pages/group/message_notification.dart';

class GroupFrontPage extends StatefulWidget {
  const GroupFrontPage({Key? key}) : super(key: key);

  @override
  _GroupFrontPageState createState() => _GroupFrontPageState();
}

class _GroupFrontPageState extends State<GroupFrontPage> {
  static const List groupPageList = [PunchPage(), AttendanceManagementPage(), MessageNotificationPage()];
  int groupPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
          ),
          onPressed: () {},
          child: Text("三"),
        ),
        bottom: PreferredSize(
            child: Row(children: [
              TextButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith((states) {
                    if (groupPageIndex == 0) {
                      return BorderSide(color: Colors.black);
                    }
                    return BorderSide.none;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                ),
                onPressed: () {setState(() {
                  groupPageIndex = 0;
                });},
                child: const Text(
                  "上班打卡",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith((states) {
                    if (groupPageIndex == 1) {
                      return BorderSide(color: Colors.black);
                    }
                    return BorderSide.none;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                ),
                onPressed: () {setState(() {
                  groupPageIndex = 1;
                });},
                child: const Text(
                  "請假加班",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith((states) {
                    if (groupPageIndex == 2) {
                      return const BorderSide(color: Colors.black);
                    }
                    return BorderSide.none;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                ),
                onPressed: () {setState(() {
                  groupPageIndex = 2;
                });},
                child: const Text(
                  "訊息通知",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
            preferredSize: const Size.fromHeight(50.0)),
      ),
      body: groupPageList[groupPageIndex],
    );
  }
}
