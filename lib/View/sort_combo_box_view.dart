import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// WidgetTestで使用するKey
final sortComboBoxKey = UniqueKey();

class SortComboBoxView extends ConsumerWidget {
  final List<String> dropDownValues;
  final String isSelectedValue;
  final Function updateSelectedValue;

  const SortComboBoxView({
    super.key,
    required this.dropDownValues,
    required this.isSelectedValue,
    required this.updateSelectedValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        key: sortComboBoxKey,
        value: isSelectedValue,
        onChanged: (String? value) {
          if (value == null || value.isEmpty) return;
          updateSelectedValue(value);
        },
      ),
    );
  }
}
