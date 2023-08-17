import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/sort_combo_box_view.dart';
import 'package:todo_app/ViewModel/main_view_model.dart';

import 'TabView/todo_tab_controller_view.dart';

var scaffoldColumnKey = GlobalKey();
var sortComboBoxKey = GlobalKey();

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
        key: scaffoldColumnKey,
        children: [
          SortComboBoxView(
            key: sortComboBoxKey,
            dropDownValues: MainViewModel.sortComboBoxValues,
            isSelectedValue: state.sortComboBoxValue,
            updateSelectedValue: notifier.updateSelectedValue,
            parentColumnKey: scaffoldColumnKey,
          ),
          TodoTabControllerView(
            parentColumnKey: scaffoldColumnKey,
            sortComboBoxKey: sortComboBoxKey,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          notifier.onTapAddTodoButton(context);
        },
        tooltip: 'Todo追加ボタン',
        child: const Icon(Icons.add),
      ),
    );
  }
}
