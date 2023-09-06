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
  @override
  void initState() {
    super.initState();
    var notifier = ref.read(commonBottomSheetViewModelProvider.notifier);
    Future(() {
      notifier.initCommonBottomSheetState(widget.todoDto);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              controller: widget.isEdit ? notifier.textField : null,
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
                    groupValue: state.emergencyPoint,
                    onValueChanged: (value) {
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
                    groupValue: state.priorityPoint,
                    onValueChanged: (value) {
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
                    groupValue: state.status,
                    onValueChanged: (value) {
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
