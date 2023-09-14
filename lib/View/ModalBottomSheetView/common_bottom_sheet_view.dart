import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Domain/EditTodo/edit_todo.dart';
import 'package:todo_app/Domain/Tab/tab.dart';
import 'package:todo_app/Domain/TodoList/todo.dart';

// WidgetTestで使用するKey
final titleKey = UniqueKey();
final emergencyKey = UniqueKey();
final priorityKey = UniqueKey();
final statusKey = UniqueKey();

class CommonBottomSheetView extends ConsumerWidget {
  CommonBottomSheetView({
    Key? key,
    todoDto,
  }) : super(key: key);

  Todo? todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        /// タイトル
        Container(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            top: 20,
            bottom: 10,
          ),
          child: SizedBox(
            child: TextField(
              key: titleKey,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Todoのタイトル',
              ),
              controller: ref.watch(editTodoProvider.notifier).textController,
              onChanged: (text) {
                ref.read(editTodoProvider.notifier).setTitle(text);
              },
            ),
          ),
        ),

        /// 緊急度
        Container(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 10,
            bottom: 10,
          ),
          child: SizedBox(
            child: Column(
              children: [
                const Text(
                  '緊急度',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoSegmentedControl(
                    key: emergencyKey,
                    children: const {
                      1: Text("1"),
                      2: Text("2"),
                      3: Text("3"),
                    },
                    groupValue: ref.watch(editTodoProvider).emergencyPoint,
                    onValueChanged: (value) {
                      ref
                          .read(editTodoProvider.notifier)
                          .setEmergencyPoint(value);
                    },
                    selectedColor: CupertinoColors.secondaryLabel,
                    pressedColor: CupertinoColors.secondaryLabel,
                    unselectedColor: CupertinoColors.systemGrey4,
                    borderColor: CupertinoColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),

        /// 重要度
        Container(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 10,
            bottom: 10,
          ),
          child: SizedBox(
            child: Column(
              children: [
                const Text(
                  '重要度',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoSegmentedControl(
                    key: priorityKey,
                    children: const {
                      1: Text("1"),
                      2: Text("2"),
                      3: Text("3"),
                    },
                    groupValue: ref.watch(editTodoProvider).primaryPoint,
                    onValueChanged: (value) {
                      ref
                          .read(editTodoProvider.notifier)
                          .setPrimaryPoint(value);
                    },
                    selectedColor: CupertinoColors.secondaryLabel,
                    pressedColor: CupertinoColors.secondaryLabel,
                    unselectedColor: CupertinoColors.systemGrey4,
                    borderColor: CupertinoColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),

        /// ステータス
        Container(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 10,
            bottom: 20,
          ),
          child: SizedBox(
            child: Column(
              children: [
                const Text(
                  'ステータス',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoSegmentedControl(
                    key: statusKey,
                    children: {
                      TabState.notBegin: Text(TabState.notBegin.tabName),
                      TabState.progress: Text(TabState.progress.tabName),
                      TabState.stay: Text(TabState.stay.tabName),
                      TabState.complete: Text(TabState.complete.tabName),
                    },
                    groupValue: ref.watch(editTodoProvider).tabStatus,
                    onValueChanged: (value) {
                      ref.read(editTodoProvider.notifier).setTabStatus(value);
                    },
                    selectedColor: CupertinoColors.secondaryLabel,
                    pressedColor: CupertinoColors.secondaryLabel,
                    unselectedColor: CupertinoColors.systemGrey4,
                    borderColor: CupertinoColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
