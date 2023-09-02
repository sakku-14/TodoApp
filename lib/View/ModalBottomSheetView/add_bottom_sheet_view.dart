import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/ModalBottomSheetView/common_bottom_sheet_view.dart';

import '../../ViewModel/add_bottom_sheet_view_model.dart';

// WidgetTest用Key
var addBottomSheetKey = UniqueKey();
var cancelButtonKey = UniqueKey();
var addButtonKey = UniqueKey();

class AddBottomSheetView extends ConsumerWidget {
  const AddBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonButtonSheetViewKey =
        GlobalObjectKey<CommonBottomSheetViewState>(context);
    var notifier = ref.read(addBottomSheetViewModelProvider.notifier);
    return SingleChildScrollView(
      child: Column(
        key: addBottomSheetKey,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Todoの登録',
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
                      key: addButtonKey,
                      onPressed: () {
                        var todoDto = commonButtonSheetViewKey.currentState
                            ?.getInputInfo();
                        if (todoDto == null) return;
                        notifier.addTodo(
                          context,
                          todoDto,
                        );
                        Navigator.of(context).pop();
                      },
                      onLongPress: () {},
                      child: const Text('登録'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CommonBottomSheetView(key: commonButtonSheetViewKey),
        ],
      ),
    );
  }
}