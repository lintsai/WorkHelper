import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';

class CompanySettingPunchView extends StatelessWidget {
  const CompanySettingPunchView(this.companyName, {Key? key}) : super(key: key);
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: createListView(),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: Text(companyName + " - " + I18nUtil.parse("companySetting.punchManagement")),
    );
  }

  ListView createListView() {
    return ListView.builder(
        itemCount: 0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile();
        });
  }
}
