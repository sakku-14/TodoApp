import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/sort_combo_box_view.dart';
import 'package:todo_app/ViewModel/MainViewModel/main_view_model.dart';

import '../ViewModel/SortComboBoxViewModel/sort_combo_box_view_model.dart';
import 'ModalBottomSheetView/add_bottom_sheet_view.dart';
import 'TabView/todo_tab_controller_view.dart';

// widgetテスト用Key
var todoTabControllerViewKey = UniqueKey();

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mainState = ref.watch(mainViewModelProvider);
    var mainNotifier = ref.read(mainViewModelProvider.notifier);
    var sortComboBoxState = ref.watch(sortComboBoxViewModelProvider);
    var sortComboBoxNotifier = ref.read(sortComboBoxViewModelProvider.notifier);

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoアプリ'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: SortComboBoxView(
              dropDownValues: SortComboBoxViewModel.sortComboBoxValues,
              isSelectedValue: sortComboBoxState.sortComboBoxValue,
              updateSelectedValue: sortComboBoxNotifier.updateSelectedValue,
            ),
          ),
          Flexible(
            flex: isLandscape ? 7 : 10,
            child: TodoTabControllerView(
              key: todoTabControllerViewKey,
              notBeginTodoDtoList: mainState.notBeginTodoDtoList,
              progressTodoDtoList: mainState.progressTodoDtoList,
              stayTodoDtoList: mainState.stayTodoDtoList,
              completeTodoDtoList: mainState.completeTodoDtoList,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddBottomSheetView(),
              );
            },
          );
        },
        tooltip: 'Todo追加ボタン',
        child: const Icon(Icons.add),
      ),
    );
  }
}
