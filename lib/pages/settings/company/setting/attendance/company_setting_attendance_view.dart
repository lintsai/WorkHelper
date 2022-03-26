import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';

class CompanySettingAttendanceView extends StatefulWidget {
  const CompanySettingAttendanceView(this.companyName, {Key? key}) : super(key: key);
  final String companyName;


  @override
  _CompanySettingAttendanceViewState createState() => _CompanySettingAttendanceViewState();
}

class _CompanySettingAttendanceViewState extends State<CompanySettingAttendanceView> {
  final List<String> _pagesList = [
    "請假加班審核者",
    "開啟補修功能",
    "加班換算補休比例",
    "特休重置日期",
    "人員特休",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: createListView(),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: Text(widget.companyName + " - " + I18nUtil.parse("companySetting.attendanceManagement")),
    );
  }

  ListView createListView() {
    return ListView.builder(
        itemCount: _pagesList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_pagesList[index]),
          );
        });
  }
}
