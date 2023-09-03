import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/ViewModel/CommonBottomSheetViewModel/common_bottom_sheet_view_model.dart';

import '../../ViewModel/Dto/todo_dto.dart';

// WidgetTestで使用するKey
final titleKey = UniqueKey();
final emergencyKey = UniqueKey();
final priorityKey = UniqueKey();
final statusKey = UniqueKey();
bool isFirstEdit = true;

class CommonBottomSheetView extends ConsumerWidget {
  final TodoDto? todoDto;
  final bool isEdit;
  final TextEditingController? areaController;

  const CommonBottomSheetView({
    super.key,
    required this.isEdit,
    this.todoDto,
    this.areaController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(commonBottomSheetViewModelProvider);
    var notifier = ref.read(commonBottomSheetViewModelProvider.notifier);

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
              controller: isEdit ? areaController : null,
              onChanged: (text) {
                notifier.holdInputTodoInfo(TodoDto(
                  text,
                  state.emergencyPoint,
                  state.priorityPoint,
                  state.status,
                ));
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
                    groupValue: isFirstEdit
                        ? todoDto?.emergencyPoint
                        : state.emergencyPoint,
                    onValueChanged: (value) {
                      isFirstEdit = false;
                      notifier.holdInputTodoInfo(TodoDto(
                        state.title,
                        value,
                        state.priorityPoint,
                        state.status,
                      ));
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
                    groupValue: isFirstEdit
                        ? todoDto?.priorityPoint
                        : state.priorityPoint,
                    onValueChanged: (value) {
                      isFirstEdit = false;
                      notifier.holdInputTodoInfo(TodoDto(
                        state.title,
                        state.emergencyPoint,
                        value,
                        state.status,
                      ));
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
                    groupValue: isFirstEdit ? todoDto?.status : state.status,
                    onValueChanged: (value) {
                      isFirstEdit = false;
                      notifier.holdInputTodoInfo(TodoDto(
                        state.title,
                        state.emergencyPoint,
                        state.priorityPoint,
                        value,
                      ));
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
