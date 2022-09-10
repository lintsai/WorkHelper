import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_bar/component/default_dropdown_item.dart';
import 'package:navigation_bar/component/default_dropdown_list_tile.dart';
import 'package:navigation_bar/component/default_switch_list_tile.dart';
import 'package:navigation_bar/component/default_select_time_list_tile.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';


class CompanySettingPunchView extends StatefulWidget {
  const CompanySettingPunchView(this.companyName, {Key? key}) : super(key: key);
  final String companyName;

  @override
  _CompanySettingPunchViewState createState() =>
      _CompanySettingPunchViewState();
}

class _CompanySettingPunchViewState extends State<CompanySettingPunchView> {
  final List<String> _pagesList = [
    "開啟自動打下班卡",
    "上班時間",
    "上班時數(分鐘)",
    "間隔休息時數(分鐘)",
    "上班日",
  ];
  final List<bool> _switchFlagList = [
    false,
  ];
  String onWorkTime = ":";

  List<TextEditingController> phoneTextFieldController = [
    TextEditingController(),
    TextEditingController()
  ];
  String onWorkDay = "Monday";

  @override
  Widget build(BuildContext context) {
    phoneTextFieldController[0].text = "480";
    phoneTextFieldController[1].text = "60";
    return Scaffold(
      appBar: createAppBar(),
      body: createListView(),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: Text(widget.companyName +
          " - " +
          I18nUtil.parse("companySetting.punchManagement"),),

    );
  }

  ListView createListView() {
    return ListView.builder(
        itemCount: _pagesList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return createSwitchListTile(index);
          }
          if (index == 1) {
            return createTimeSelectListTile(context, index);
          }
          if (index == 2 || index == 3) {
            return createInputNumberListTile(index);
          }
          return createDropDownListTile(index);
        });
  }

  SwitchListTile createSwitchListTile(int index) {
    return DefaultSwitchListTile(
        titleText: _pagesList[index],
        value: _switchFlagList[index],
        onChanged: (value) {
          setState(() {
            _switchFlagList[index] = value;
          });
        });
  }

  ListTile createTimeSelectListTile(BuildContext context, int index) {
    int tempHour = int.tryParse(onWorkTime.split(":")[0]) != null
        ? int.parse(onWorkTime.split(":")[0])
        : 0;
    int tempMinute = int.tryParse(onWorkTime.split(":")[1]) != null
        ? int.parse(onWorkTime.split(":")[1])
        : 0;
    return DefaultSelectTimeListTile(
      titleText: _pagesList[index],
      hour: tempHour,
      minute: tempMinute,
      context: context,
      onSelected: (selectedTime) {
        setState(() {
          onWorkTime = selectedTime.hour.toString() +
              ":" +
              selectedTime.minute.toString();
        });
      },
    );
  }

  ListTile createInputNumberListTile(int index) {
    return ListTile(
      title: Text(_pagesList[index]),
      subtitle: TextField(
        controller: phoneTextFieldController[index - 2],
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
      ),
    );
  }

  ListTile createDropDownListTile(int index) {
    return DefaultDropdownListTile(
      titleText: _pagesList[index],
      dropdownValue: onWorkDay,
      itemList: <DefaultDropdownItem>[
        DefaultDropdownItem(value: "Monday", text: "星期一"),
        DefaultDropdownItem(value: "Tuesday", text: "星期二"),
        DefaultDropdownItem(value: "Wednesday", text: "星期三"),
        DefaultDropdownItem(value: "Thursday", text: "星期四"),
        DefaultDropdownItem(value: "Friday", text: "星期五"),
        DefaultDropdownItem(value: "Saturday", text: "星期六"),
        DefaultDropdownItem(value: "Sunday", text: "星期日"),
      ],
      onSelected: (String? value) {
        setState(() {
          onWorkDay = value!;
        });
      },
    );
  }
}
