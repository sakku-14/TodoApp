import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Model/SortType/sort_type.dart';

/// WidgetTestで使用するKey
final sortComboBoxKey = UniqueKey();

class SortComboBoxView extends ConsumerWidget {
  const SortComboBoxView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SortState selectedSortType = ref.watch(sortTypeProvider);

    return Center(
      child: DropdownButton(
        items: [
          for (var value in selectedSortType.sortTypeList) ...[
            DropdownMenuItem(
              value: value,
              child: Text(value),
            ),
          ]
        ],
        key: sortComboBoxKey,
        value: selectedSortType.typeName,
        onChanged: (value) {
          if (value == null || value.isEmpty) return;

          ref.read(sortTypeProvider.notifier).update(SortState.fromName(value));
        },
      ),
    );
  }
}
