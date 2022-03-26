import 'package:flutter/material.dart';

import 'default_dropdown_item.dart';

class DefaultDropdownMultipleListTile extends ListTile {
  // DefaultDropdownMultipleListTile(
  //     {Key? key,
  //     required String titleText,
  //     required List<String> dropdownValueList,
  //     required List<DefaultDropdownItem> itemList,
  //     required ValueChanged<String?>? onSelected})
  //     : super(
  //         key: key,
  //         title: Text(titleText),
  //         subtitle: DropdownButton<String>(
  //           isExpanded: true,
  //           value: dropdownValueList.join(","),
  //           underline: Container(
  //             height: 2,
  //             color: Colors.grey,
  //           ),
  //           onChanged: (String? newValue) {
  //             if (onSelected != null) {
  //               onSelected(newValue);
  //             }
  //           },
  //           items: itemList.map((DefaultDropdownItem item) {
  //             return DropdownMenuItem<String>(
  //               value: item.value,
  //               child: Text(item.text),
  //             );
  //           }).toList(),
  //           onTap: () {},
  //         ),
  //       );
}
