import 'package:flutter/material.dart';

class WorkAction {
  static List<Tab> getTabList() {
    return <Tab>[
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
  }
}
