import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/ViewModel/edit_bottom_sheet_view_model.dart';

class EditBottomSheetView extends ConsumerWidget {
  const EditBottomSheetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(editBottomSheetViewModelProvider.notifier);
    var screenSize = MediaQuery.of(context).size;
    String? todoTitle = '初期値';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: screenSize.width * 0.3,
              child: TextButton(
                onPressed: () {},
                onLongPress: () {},
                child: const Text('キャンセル'),
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.4,
              child: Text(
                'Todoの更新',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width * 0.04),
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.3,
              child: TextButton(
                onPressed: () {
                  if (todoTitle == null) return;
                  notifier.updateTodo(todoTitle.toString());
                },
                onLongPress: () {},
                child: const Text('更新'),
              ),
            ),
          ],
        ),
        // TODO:23.8.17:A.Uehara:ここから下は共通のダイアログを使う
        Container(
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
        ),
      ],
    );
  }
}
