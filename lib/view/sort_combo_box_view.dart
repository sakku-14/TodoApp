import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/model.dart';

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
        key: sortComboBoxKey,
        items: [
          for (var value in selectedSortType.sortTypeList) ...[
            DropdownMenuItem(
              value: value,
              child: Text(value),
            ),
          ]
        ],
        value: selectedSortType.typeName,
        onChanged: (value) {
          if (value == null || value.isEmpty) return;

          ref.read(sortTypeProvider.notifier).update(SortState.fromName(value));
        },
      ),
    );
  }
}
