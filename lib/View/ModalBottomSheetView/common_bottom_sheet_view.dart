import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Domain/EditTodo/edit_todo.dart';
import 'package:todo_app/Domain/Tab/tab.dart';

import '../../ViewModel/Dto/todo_dto.dart';

// WidgetTestで使用するKey
final titleKey = UniqueKey();
final emergencyKey = UniqueKey();
final priorityKey = UniqueKey();
final statusKey = UniqueKey();

class CommonBottomSheetView extends ConsumerStatefulWidget {
  const CommonBottomSheetView(
    this.isEdit,
    this.todoDto, {
    Key? key,
  }) : super(key: key);

  final bool isEdit;
  final TodoDto todoDto;

  @override
  CommonBottomSheetViewModelState createState() =>
      CommonBottomSheetViewModelState();
}

class CommonBottomSheetViewModelState
    extends ConsumerState<CommonBottomSheetView> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController =
        TextEditingController(text: ref.watch(editTodoProvider).title);
  }

  @override
  Widget build(BuildContext context) {
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
              controller: textController,
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
                      1: Text(TabState.notBegin.tabName),
                      2: Text(TabState.progress.tabName),
                      3: Text(TabState.stay.tabName),
                      4: Text(TabState.complete.tabName),
                    },
                    groupValue: ref.watch(editTodoProvider).tabStatus.tabName,
                    onValueChanged: (value) {
                      ref
                          .read(editTodoProvider.notifier)
                          .setTabStatus(TabState.fromName(value as String));
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
