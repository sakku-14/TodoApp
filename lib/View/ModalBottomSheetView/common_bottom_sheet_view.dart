import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/ViewModel/CommonBottomSheetViewModel/common_bottom_sheet_view_model.dart';

// WidgetTestで使用するKey
final titleKey = UniqueKey();
final emergencyKey = UniqueKey();
final priorityKey = UniqueKey();
final statusKey = UniqueKey();

class CommonBottomSheetView extends ConsumerWidget {
  const CommonBottomSheetView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(commonBottomSheetViewModelProvider);
    var notifier = ref.read(commonBottomSheetViewModelProvider.notifier);

    print(state.toString());

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
              controller: notifier.controller,
              onChanged: (text) {
                notifier.setTitle();
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
                    groupValue: state.emergencyPoint,
                    onValueChanged: (value) {
                      notifier.setEmergencyPoint(value);
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
                    groupValue: state.priorityPoint,
                    onValueChanged: (value) {
                      notifier.setPriorityPoint(value);
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
                    children: const {
                      1: Text("未着手"),
                      2: Text("作業中"),
                      3: Text("保留"),
                      4: Text("完了"),
                    },
                    groupValue: state.status,
                    onValueChanged: (value) {
                      notifier.setStatus(value);
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
