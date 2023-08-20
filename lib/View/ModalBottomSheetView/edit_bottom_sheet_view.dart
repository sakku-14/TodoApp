import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/ModalBottomSheetView/common_bottom_sheet_view.dart';

import '../../ViewModel/edit_bottom_sheet_view_model.dart';

// WidgetTest用Key
var editBottomSheetKey = UniqueKey();
var cancelButtonKey = UniqueKey();
var editButtonKey = UniqueKey();

class EditBottomSheetView extends ConsumerWidget {
  const EditBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonButtonSheetViewKey =
        GlobalObjectKey<CommonBottomSheetViewState>(context);
    var notifier = ref.read(editBottomSheetViewModelProvider.notifier);
    return Column(
      key: editBottomSheetKey,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'Todoの更新',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: TextButton(
                    key: cancelButtonKey,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    onLongPress: () {},
                    child: const Text('キャンセル'),
                  ),
                ),
                SizedBox(
                  child: TextButton(
                    key: editButtonKey,
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
          ],
        ),
        CommonBottomSheetView(key: commonButtonSheetViewKey),
      ],
    );
  }
}
