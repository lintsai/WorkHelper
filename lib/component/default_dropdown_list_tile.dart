import 'package:flutter/material.dart';

import 'default_dropdown_item.dart';

class DefaultDropdownListTile extends ListTile {
  DefaultDropdownListTile(
      {Key? key,
        required String titleText,
        required String dropdownValue,
        required List<DefaultDropdownItem> itemList,
        required ValueChanged<String?>? onSelected})
      : super(
      key: key,
    title: Text(titleText),
    subtitle: DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String? newValue) {
        if(onSelected != null){
          onSelected(newValue);
        }
      },
      items: itemList.map((DefaultDropdownItem item) {
        return DropdownMenuItem<String>(
          value: item.value,
          child: Text(item.text),
        );
      }).toList(),
      onTap: () {},
    ),
  );
}