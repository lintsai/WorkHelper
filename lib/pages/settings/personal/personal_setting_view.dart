import 'package:flutter/material.dart';
import 'package:navigation_bar/pages/work/drawer/work_drawer_view.dart';

class PersonalSettingView extends StatefulWidget {
  const PersonalSettingView({Key? key}) : super(key: key);

  @override
  _PersonalSettingViewState createState() => _PersonalSettingViewState();
}

class _PersonalSettingViewState extends State<PersonalSettingView> {
  List<String> personalSettingTitleList = [
    "允許上班打卡提示",
    "允許請假加班審核提示",
    "允許訊息通知提示",
    "允許點餐提示",
    "預設部門",
    "預設上班打卡時間",
    "預設下班打卡時間",
    "預設點餐提醒時間"
  ];
  List<bool> switchFlagList = [
    false,
    false,
    false,
    false,
  ];
  List<String> alterTimeStringList = [
    ":",
    ":",
    ":",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('個人設定'),
      ),
      drawer: const WorkDrawerView(),
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            if (index < 4) {
              return SwitchListTile(
                title: Text(personalSettingTitleList[index]),
                controlAffinity: ListTileControlAffinity.leading,
                value: switchFlagList[index],
                onChanged: (bool value) {
                  setState(() {
                    switchFlagList[index] = value;
                  });
                },
              );
            }
            if (index == 4) {
              return ListTile(
                title: Text(personalSettingTitleList[index]),
                subtitle: DropdownButton<String>(
                  isExpanded: true,
                  value: "One",
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (String? newValue) {
                    // setState(() {
                    // dropdownValue = newValue!;
                    // });
                  },
                  items: ['One', 'Two', 'Free', 'Four'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onTap: () {},
                ),
              );
            }
            return ListTile(
              title: Text(personalSettingTitleList[index]),
              subtitle: TextButton(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      alterTimeStringList[index - 5],
                      style: const TextStyle(color: Colors.black)
                  ),
                ),
                onPressed: () async {
                  // TimeOfDay selectedTime =
                  String hourAndMinute = alterTimeStringList[index - 5];
                  int tempHour = int.tryParse(hourAndMinute.split(":")[0]) != null ? int.parse(hourAndMinute.split(":")[0]) : 0;
                  int tempMinute = int.tryParse(hourAndMinute.split(":")[1]) != null ? int.parse(hourAndMinute.split(":")[1]) : 0;

                  final TimeOfDay? selectedTime = await showTimePicker(
                      initialTime: TimeOfDay(
                          hour: tempHour,
                          minute: tempMinute
                      ),
                      context: context
                  );
                  if(selectedTime != null){
                    setState(() {
                      alterTimeStringList[index - 5] = selectedTime.hour.toString() + ":" + selectedTime.minute.toString();
                    });
                  }
                },
              ),
            );
          }),
    );
  }
}
