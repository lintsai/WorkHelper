import 'package:flutter/material.dart';

import '../tool/date_tool.dart';

class DefaultSelectDateListTile extends ListTile {
  DefaultSelectDateListTile({
    Key? key,
    required BuildContext context,
    required String titleText,
    required DateTime? selectedDate,
    required ValueChanged<DateTime>? onSelected,
  }) : super(
          key: key,
          title: Text(titleText),
          subtitle: TextButton(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(selectedDate != null ? DateTool.formatDate(selectedDate) : "",
                  style: const TextStyle(color: Colors.black)),
            ),
            onPressed: () async {
              final DateTime? selectedTime = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2020, 01),
                  lastDate: DateTime(2100, 12));
              if (selectedTime != null && onSelected != null) {
                onSelected(selectedTime);
              }
            },
          ),
        );
}
