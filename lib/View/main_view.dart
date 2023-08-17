import 'dart:math' as math; // Debug用

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/sort_combo_box_view.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';
import 'package:todo_app/ViewModel/main_view_model.dart';

import 'TabView/todo_tab_controller_view.dart';

// region Debug用
var random = math.Random();
var notBeginTodoDtoList = [
  for (var i = 0; i < 16; i++) ...[
    TodoDto('notBegin', random.nextInt(3) + 1, random.nextInt(3) + 1)
  ]
];
var progressTodoDtoList = [
  for (var i = 0; i < 16; i++) ...[
    TodoDto('progress', random.nextInt(3) + 1, random.nextInt(3) + 1)
  ]
];
var stayTodoDtoList = [
  for (var i = 0; i < 16; i++) ...[
    TodoDto('stay', random.nextInt(3) + 1, random.nextInt(3) + 1)
  ]
];
var completeTodoDtoList = [
  for (var i = 0; i < 16; i++) ...[
    TodoDto('complete', random.nextInt(3) + 1, random.nextInt(3) + 1)
  ]
];
// endregion

// widgetテスト用Key
var todoTabControllerViewKey = UniqueKey();

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
          Flexible(
            flex: 1,
            child: SortComboBoxView(
              dropDownValues: MainViewModel.sortComboBoxValues,
              isSelectedValue: state.sortComboBoxValue,
              updateSelectedValue: notifier.updateSelectedValue,
            ),
          ),
          Flexible(
            flex: 10,
            child: TodoTabControllerView(
              key: todoTabControllerViewKey,
              notBeginTodoDtoList: notBeginTodoDtoList,
              progressTodoDtoList: progressTodoDtoList,
              stayTodoDtoList: stayTodoDtoList,
              completeTodoDtoList: completeTodoDtoList,
            ),
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
