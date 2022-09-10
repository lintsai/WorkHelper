import 'package:flutter/material.dart';
import 'package:navigation_bar/component/default_dropdown_item.dart';
import 'package:navigation_bar/component/default_dropdown_list_tile.dart';
import 'package:navigation_bar/component/default_select_date_list_tile.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';

class CompanySettingExportReportView extends StatefulWidget {
  const CompanySettingExportReportView(this.companyName, {Key? key})
      : super(key: key);
  final String companyName;

  @override
  _CompanySettingExportReportViewState createState() =>
      _CompanySettingExportReportViewState();
}

class _CompanySettingExportReportViewState
    extends State<CompanySettingExportReportView> {
  final List<String> _pagesList = [
    "報表類型",
    "開始時間",
    "結束時間",
    "報表匯出",
  ];
  String exportReport = "AttendanceReport";
  List<DateTime> selectedDateList = <DateTime>[];
  List<Icon> exportIconList = <Icon>[
    const Icon(Icons.share),
    const Icon(Icons.cloud),
    const Icon(Icons.copy),
    const Icon(Icons.print),
  ];
  List<String> exportTitleList = <String>[
    "Share Link",
    "Email",
    "Download",
    "Print",
  ];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    selectedDateList = <DateTime>[DateTime(now.year, now.month, 1), now];
    return Scaffold(
      appBar: createAppBar(),
      body: createListView(),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: Text(widget.companyName +
          " - " +
          I18nUtil.parse("companySetting.exportReport")),
    );
  }

  ListView createListView() {
    return ListView.builder(
        itemCount: _pagesList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return createDropDownListTile(index);
          }
          if (index == 1 || index == 2) {
            return createSelectDateListTile(context, index);
          }

          return ListTile(
            title: Center(
              child: TextButton(
                child: Text(
                  _pagesList[index],
                  style: const TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith((states) {
                    return const BorderSide(color: Colors.black);
                  }),
                  padding: MaterialStateProperty.resolveWith((states) =>
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.black),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: exportIconList[index],
                                title: Text(exportTitleList[index]),
                                onTap: () => {Navigator.pop(context)},
                              );
                            }),
                      );
                    },
                  );
                },
              ),
            ),
          );
        });
  }

  ListTile createDropDownListTile(int index) {
    return DefaultDropdownListTile(
      titleText: _pagesList[index],
      dropdownValue: exportReport,
      itemList: <DefaultDropdownItem>[
        DefaultDropdownItem(value: "AttendanceReport", text: "考勤報表"),
        DefaultDropdownItem(value: "Monday", text: "請假報表"),
      ],
      onSelected: (String? value) {
        setState(() {
          exportReport = value!;
        });
      },
    );
  }

  ListTile createSelectDateListTile(BuildContext context, int index) {
    return DefaultSelectDateListTile(
      titleText: _pagesList[index],
      context: context,
      selectedDate: selectedDateList[index - 1],
      onSelected: (DateTime selectedDate) {
        setState(() {
          selectedDateList[index - 1] = selectedDate;
        });
      },
    );
  }
}
