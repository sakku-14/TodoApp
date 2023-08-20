import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ViewModel/Dto/todo_dto.dart';

class CommonBottomSheetView extends StatefulWidget {
  const CommonBottomSheetView({Key? key}) : super(key: key);

  @override
  CommonBottomSheetViewState createState() => CommonBottomSheetViewState();
}

class CommonBottomSheetViewState extends State<CommonBottomSheetView> {
  String todoTitle = '初期値';
  int emergencyPoint = 1;
  int priorityPoint = 1;
  int todoStatus = 1;

  /// Todoの入力情報を取得
  TodoDto getInputInfo() {
    return TodoDto(todoTitle, emergencyPoint, priorityPoint, todoStatus);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        /// タイトル
        Container(
          margin: EdgeInsets.only(top: screenSize.height * 0.02),
          child: SizedBox(
            width: screenSize.width * 0.8,
            child: TextField(
              onChanged: (text) {
                todoTitle = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Todoのタイトル',
              ),
            ),
          ),
        ),

        /// 緊急度
        Container(
          margin: EdgeInsets.only(top: screenSize.height * 0.02),
          child: SizedBox(
            width: screenSize.width * 0.8,
            child: Column(
              children: [
                Text(
                  '緊急度',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.width * 0.04),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoSegmentedControl(
                    children: const {
                      1: Text("1"),
                      2: Text("2"),
                      3: Text("3"),
                    },
                    onValueChanged: (value) {
                      emergencyPoint = value;
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
          margin: EdgeInsets.only(top: screenSize.height * 0.02),
          child: SizedBox(
            width: screenSize.width * 0.8,
            child: Column(
              children: [
                Text(
                  '重要度',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.width * 0.04),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoSegmentedControl(
                    children: const {
                      1: Text("1"),
                      2: Text("2"),
                      3: Text("3"),
                    },
                    onValueChanged: (value) {
                      priorityPoint = value;
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
          margin: EdgeInsets.only(
            top: screenSize.height * 0.02,
            bottom: screenSize.height * 0.05,
          ),
          child: SizedBox(
            width: screenSize.width * 0.8,
            child: Column(
              children: [
                Text(
                  'ステータス',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.width * 0.04),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoSegmentedControl(
                    children: const {
                      1: Text("未着手"),
                      2: Text("作業中"),
                      3: Text("保留"),
                      4: Text("完了"),
                    },
                    onValueChanged: (value) {
                      todoStatus = value;
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
