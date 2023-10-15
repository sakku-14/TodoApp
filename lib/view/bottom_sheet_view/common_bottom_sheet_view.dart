import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/model.dart';

// WidgetTestで使用するKey
final titleKey = UniqueKey();
final emergencyKey = UniqueKey();
final emergency1 = UniqueKey();
final emergency2 = UniqueKey();
final emergency3 = UniqueKey();
final priorityKey = UniqueKey();
final priority1 = UniqueKey();
final priority2 = UniqueKey();
final priority3 = UniqueKey();
final statusKey = UniqueKey();
final statusNotBegin = UniqueKey();
final statusProgress = UniqueKey();
final statusStay = UniqueKey();
final statusComplete = UniqueKey();

class CommonBottomSheetView extends ConsumerWidget {
  const CommonBottomSheetView({
    Key? key,
  }) : super(key: key);

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
              controller: ref.watch(editTodoProvider).textEditingController,
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
                    children: {
                      1: Text(key: emergency1, "1"),
                      2: Text(key: emergency2, "2"),
                      3: Text(key: emergency3, "3"),
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
                    children: {
                      1: Text(key: priority1, "1"),
                      2: Text(key: priority2, "2"),
                      3: Text(key: priority3, "3"),
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
                      TodoStatus.notBegin: Text(
                          key: statusNotBegin, TodoStatus.notBegin.statusName),
                      TodoStatus.progress: Text(
                          key: statusProgress, TodoStatus.progress.statusName),
                      TodoStatus.stay:
                          Text(key: statusStay, TodoStatus.stay.statusName),
                      TodoStatus.complete: Text(
                          key: statusComplete, TodoStatus.complete.statusName),
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
