import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';
import 'package:navigation_bar/model/company_row_vo.dart';
import 'package:navigation_bar/pages/settings/company/list/company_list_action.dart';
import 'package:navigation_bar/pages/settings/company/setting/company_setting_view.dart';
import 'package:navigation_bar/pages/work/drawer/work_drawer_view.dart';

class CompanyListView extends StatelessWidget {
  const CompanyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      drawer: const WorkDrawerView(),
      body: createListView(context),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: Text(I18nUtil.parse("companyListManagement")),
    );
  }

  ListView createListView(BuildContext context) {
    List<CompanyRowVo> friendList = CompanyListAction.getCompanyList();
    return ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (BuildContext context, int index) {
          CompanyRowVo friendRowVo = friendList[index];
          return createListTile(context, friendRowVo);
        });
  }

  ListTile createListTile(BuildContext context, CompanyRowVo friendRowVo) {
    return ListTile(
      title: Text(friendRowVo.companyName),
      subtitle: Align(
        alignment: Alignment.centerLeft,
        child: Text(
            friendRowVo.permissionList.join(","),
            style: const TextStyle(color: Colors.grey)
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CompanySettingView(friendRowVo.companyName)));
      },
    );
  }
}

