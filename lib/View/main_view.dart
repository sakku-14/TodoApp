import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/sort_combo_box_view.dart';
import 'package:todo_app/View/todo_view.dart';
import 'package:todo_app/ViewModel/main_view_model.dart';

import 'add_bottom_sheet_view.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(mainViewModelProvider);
    var notifier = ref.read(mainViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoアプリ'),
      ),
      body: Column(
        children: [
          SortComboBoxView(
            dropDownValues: MainViewModel.sortComboBoxValues,
            isSelectedValue: state.sortComboBoxValue,
            updateSelectedValue: notifier.updateSelectedValue,
          ),
          const TodoView(
            todoTitle: 'Todo Title',
            emergencyPoint: 2,
            priorityPoint: 2,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddBottomSheetView();
            },
          );
        },
        tooltip: 'Todo追加ボタン',
        child: const Icon(Icons.add),
      ),
    );
  }
}
