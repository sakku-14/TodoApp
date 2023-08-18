import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/common_bottom_sheet_view.dart';
import 'package:todo_app/ViewModel/edit_bottom_sheet_view_model.dart';

class EditBottomSheetView extends ConsumerWidget {
  EditBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonBottomSheetViewKey =
        GlobalObjectKey<CommonBottomSheetViewState>(context);
    var notifier = ref.read(editBottomSheetViewModelProvider.notifier);
    var screenSize = MediaQuery.of(context).size;

    //String? todoTitle = '初期値';
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
                  var inputInfo =
                      commonBottomSheetViewKey.currentState?.getInputInfo();
                  if (inputInfo == null) return;
                  notifier.updateTodo(inputInfo.$1.toString());
                },
                onLongPress: () {},
                child: const Text('更新'),
              ),
            ),
          ],
        ),
        CommonBottomSheetView(key: commonBottomSheetViewKey),
      ],
    );
  }
}
