import 'package:flutter/material.dart';

class SortComboBoxView extends StatelessWidget {
  const SortComboBoxView({
    super.key,
    required this.dropDownValues,
    required this.isSelectedValue,
    required this.updateSelectedValue,
  });
  final List<String> dropDownValues;
  final String isSelectedValue;
  final Function updateSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton(
        items: [
          for (var value in dropDownValues) ...[
            DropdownMenuItem(
              value: value,
              child: Text(value),
            ),
          ]
        ],
        value: isSelectedValue,
        onChanged: (String? value) {
          if (value == null || value.isEmpty) return;
          updateSelectedValue(value);
        },
      ),
    );
  }
}

enum SortComboBoxValue {
  editDate,
  prioritySeverity,
}
