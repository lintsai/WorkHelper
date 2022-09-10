import 'package:flutter/material.dart';

class DefaultSwitchListTile extends SwitchListTile {
  DefaultSwitchListTile(
      {Key? key,
      required String titleText,
      required bool value,
      required ValueChanged<bool>? onChanged})
      : super(
            key: key,
            title: Text(titleText),
            controlAffinity: ListTileControlAffinity.leading,
            value: value,
            onChanged: onChanged);
}
