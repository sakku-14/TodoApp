import 'package:flutter/material.dart';

class CommonBottomSheetView extends StatefulWidget {
  const CommonBottomSheetView({Key? key}) : super(key: key);

  @override
  CommonBottomSheetViewState createState() => CommonBottomSheetViewState();
}

class CommonBottomSheetViewState extends State<CommonBottomSheetView> {
  String? todoTitle = '初期値';

  /// Todoの入力情報を取得
  (String?, int, int) getInputInfo() {
    return (todoTitle, 1, 1);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(screenSize.width * 0.1),
      child: SizedBox(
        width: screenSize.width * 0.8,
        child: TextField(
          onChanged: (text) {
            todoTitle = text;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'タイトル',
          ),
        ),
      ),
    );
  }
}
