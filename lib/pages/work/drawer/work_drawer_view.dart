import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';
import 'package:navigation_bar/constants/page_constants.dart';
import 'package:navigation_bar/model/drawer_page_vo.dart';

class WorkDrawerView extends StatelessWidget {
  const WorkDrawerView({Key? key}) : super(key: key);

  static List<DrawerPageVo> workDrawerList = [
    DrawerPageVo("JeffHsu", "JeffHsu"),
    DrawerPageVo(I18nUtil.parse("personalSetting"), PageConstants.personalSettingView),
    DrawerPageVo(I18nUtil.parse("friendManagement"), PageConstants.friendView),
    DrawerPageVo(I18nUtil.parse("companyListManagement"), PageConstants.companyListView),
    DrawerPageVo(I18nUtil.parse("workspaceManagement"), PageConstants.friendView),
    DrawerPageVo(I18nUtil.parse("menuManagement"), PageConstants.friendView),
    DrawerPageVo(I18nUtil.parse("nearbyRestaurants"), PageConstants.friendView),
    DrawerPageVo(I18nUtil.parse("settings"), PageConstants.friendView),
    DrawerPageVo(I18nUtil.parse("rateUs"), PageConstants.friendView)
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
                title: Text(workDrawerList[index].displayName),
                subtitle: const Text("承暉資訊"),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 16.0),
                onTap: () {
                  backToWorkView(context);
                },
              );
            }
            return ListTile(
              title: Text(workDrawerList[index].displayName),
              onTap: () {
                drawItemClick(context, workDrawerList[index].pageName);
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
