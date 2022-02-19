import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';
import 'package:navigation_bar/model/company_setting_permission_row_vo.dart';
import 'package:navigation_bar/pages/settings/company/setting/permission/company_setting_permission_action.dart';

class CompanySettingPermissionView extends StatelessWidget {
  const CompanySettingPermissionView(this.companyName, {Key? key})
      : super(key: key);
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
      title: Text(companyName + " - " + I18nUtil.parse("companySetting.permissionManagement")),
    );
  }

  ListView createListView(BuildContext context) {
    List<CompanySettingPermissionRowVo> companySettingPermissionRowVoList = CompanySettingPermissionAction
        .getPermissionList();
    return ListView.builder(
        itemCount: companySettingPermissionRowVoList.length,
        itemBuilder: (BuildContext context, int index) {
          return createListTile(companySettingPermissionRowVoList[index]);
        });
  }

  ListTile createListTile(CompanySettingPermissionRowVo companySettingPermissionRowVo) {
    return ListTile(
      title: Text(companySettingPermissionRowVo.title),
      subtitle: Text(
          companySettingPermissionRowVo.memberList.join(",")
      ),
      onTap: () {},
    );
  }
}
