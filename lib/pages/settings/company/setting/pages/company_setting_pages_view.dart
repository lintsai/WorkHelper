import 'package:flutter/material.dart';
import 'package:navigation_bar/component/default_switch_list_tile.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';

class CompanySettingPagesView extends StatefulWidget {
  const CompanySettingPagesView(this.companyName, {Key? key}) : super(key: key);
  final String companyName;

  @override
  _CompanySettingPagesViewState createState() => _CompanySettingPagesViewState();
}

class _CompanySettingPagesViewState extends State<CompanySettingPagesView> {
  static final List<String> _pagesList = [
    "開啟上班打卡頁面",
    "開啟請假加班頁面",
    "開啟訊息通知頁面",
    "開啟點餐頁面",
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
      title: Text(widget.companyName + " - " + I18nUtil.parse("companySetting.pagesManagement")),
    );
  }

  ListView createListView() {
    return ListView.builder(
        itemCount: _pagesList.length+1,
        itemBuilder: (BuildContext context, int index) {
          if(index == _pagesList.length){
            return createDropDownListTile();
          }
          return createSwitchListTile(index);
        });
  }

  SwitchListTile createSwitchListTile(int index) {
    return DefaultSwitchListTile(
        titleText: _pagesList[index],
        value: switchFlagList[index],
        onChanged: (value) {
          setState(() {
            switchFlagList[index] = value;
          });
        }
    );
  }

  String dropdownValue = _pagesList[0];
  List<bool> switchFlagList = [
    false,
    false,
    false,
    false,
  ];


  ListTile createDropDownListTile() {
    return ListTile(
      title: Text("預設首頁"),
      subtitle: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        underline: Container(
          height: 2,
          color: Colors.grey,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: _pagesList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onTap: () {},
      ),
    );
  }
}
