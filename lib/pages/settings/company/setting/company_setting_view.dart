import 'package:flutter/material.dart';
import 'package:navigation_bar/model/company_setting_row_vo.dart';
import 'package:navigation_bar/pages/settings/company/setting/company_setting_action.dart';

class CompanySettingView extends StatelessWidget {
  const CompanySettingView(this.companyName, {Key? key}) : super(key: key);
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: createListView(context),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: Text(companyName),
    );
  }

  ListView createListView(BuildContext context) {
    List<CompanySettingRowVo> companySettingRowVoList =
        CompanySettingAction.getSettingList(companyName);
    return ListView.builder(
        itemCount: companySettingRowVoList.length,
        itemBuilder: (BuildContext context, int index) {
          return createListTile(context, companySettingRowVoList[index]);
        });
  }

  ListTile createListTile(
      BuildContext context, CompanySettingRowVo companySettingRowVo) {
    return ListTile(
      title: Text(companySettingRowVo.displayName),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => companySettingRowVo.onTapPage));
      },
    );
  }
}
