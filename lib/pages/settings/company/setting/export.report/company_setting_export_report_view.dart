import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/i18n/I18nUtil.dart';

class CompanySettingExportReportView extends StatelessWidget {
  const CompanySettingExportReportView(this.companyName, {Key? key})
      : super(key: key);
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
      title: Text(
          companyName + " - " + I18nUtil.parse("companySetting.exportReport")),
    );
  }

  ListView createListView() {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("trytry"),
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.amber,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Modal BottomSheet'),
                          ElevatedButton(
                            child: const Text('Close BottomSheet'),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        });
  }
}
