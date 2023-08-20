import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/ModalBottomSheetView/common_bottom_sheet_view.dart';

import '../../ViewModel/edit_bottom_sheet_view_model.dart';

class EditBottomSheetView extends ConsumerWidget {
  const EditBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonButtonSheetViewKey =
        GlobalObjectKey<CommonBottomSheetViewState>(context);
    var notifier = ref.read(editBottomSheetViewModelProvider.notifier);
    var screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: screenSize.width * 0.3,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
                    fontSize: screenSize.width * 0.05),
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.3,
              child: TextButton(
                onPressed: () {
                  var todoDto =
                      commonButtonSheetViewKey.currentState?.getInputInfo();
                  if (todoDto == null) return;
                  notifier.updateTodo(
                    context,
                    todoDto,
                  );
                  Navigator.of(context).pop();
                },
                onLongPress: () {},
                child: const Text('更新'),
              ),
            ),
          ],
        ),
        CommonBottomSheetView(key: commonButtonSheetViewKey),
      ],
    );
  }
}
