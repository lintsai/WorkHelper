import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';
import 'package:navigation_bar/model/friend_row_vo.dart';
import 'package:navigation_bar/pages/settings/friend/friend_action.dart';
import 'package:navigation_bar/pages/work/drawer/work_drawer_view.dart';

class FriendView extends StatelessWidget {
  const FriendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      drawer: const WorkDrawerView(),
      body: createListView(),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: Text(I18nUtil.parse("friendManagement")),
    );
  }

  ListView createListView() {
    List<FriendRowVo> friendList = FriendAction.getFriendList();
    return ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (BuildContext context, int index) {
          FriendRowVo friendRowVo = friendList[index];
          return createListTile(friendRowVo);
        });
  }

  ListTile createListTile(FriendRowVo friendRowVo) {
    return ListTile(
      title: Text(friendRowVo.name),
      subtitle: Align(
        alignment: Alignment.centerLeft,
        child: Text(friendRowVo.companyList.join(","),
            style: const TextStyle(color: Colors.grey)),
      ),
      onTap: () {},
    );
  }
}
