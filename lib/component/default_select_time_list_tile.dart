import 'package:flutter/material.dart';

class DefaultSelectTimeListTile extends ListTile {
  DefaultSelectTimeListTile
      ({Key? key,
        required String titleText,
        required int hour,
        required int minute,
        required BuildContext context,
        required ValueChanged<TimeOfDay>? onSelected,
      }) : super(key: key,
    title: Text(titleText),
    subtitle: TextButton(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(hour.toString() + ":" + minute.toString(),
            style: const TextStyle(color: Colors.black)),
      ),
      onPressed: () async {
        // TimeOfDay selectedTime =
        int tempHour = hour;
        int tempMinute = minute;

        final TimeOfDay? selectedTime = await showTimePicker(
            initialTime:
            TimeOfDay(hour: tempHour, minute: tempMinute),
            context: context
        );
        if (selectedTime != null && onSelected != null) {
          onSelected(selectedTime);
        }
      },
    ),
  );
}
