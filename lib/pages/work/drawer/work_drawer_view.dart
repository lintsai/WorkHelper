import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/page_constants.dart';

class WorkDrawerView extends StatelessWidget {
  const WorkDrawerView({Key? key}) : super(key: key);

  static List<String> workDrawerList = [
    "JeffHsu",
    "好友管理",
    "公司部門管理",
    "工作區管理",
    "菜單管理",
    "附近餐廳",
    "Settings",
    "Rate us"
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView.builder(
          itemCount: workDrawerList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/sample_image.jpg"),
                ),
                title: Text(workDrawerList[index]),
                subtitle: const Text("承暉資訊"),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 16.0),
                onTap: () {
                  backToWorkView(context);
                },
              );
            }
            return ListTile(
              title: Text(workDrawerList[index]),
              onTap: () {
                drawItemClick(context, PageConstants.personalSettingPage);
              },
            );
          }),
    );
  }

  void backToWorkView(BuildContext context) {
    // 移除 draw
    Navigator.of(context).pop();
    // 回到workView
    Navigator.of(context).popUntil((route) {
      return route.settings.name == PageConstants.workPage;
    });
  }
  void drawItemClick(BuildContext context, String pageName) {
    backToWorkView(context);
    Navigator.of(context).pushNamed(pageName);
  }
}
