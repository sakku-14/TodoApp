import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/ModalBottomSheetView/common_bottom_sheet_view.dart';

import '../../ViewModel/AddBottomSheetViewModel/add_bottom_sheet_view_model.dart';
import '../../ViewModel/CommonBottomSheetViewModel/common_bottom_sheet_view_model.dart';
import '../../ViewModel/Dto/todo_dto.dart';

// WidgetTest用Key
var addBottomSheetKey = UniqueKey();
var cancelButtonKey = UniqueKey();
var addButtonKey = UniqueKey();

class AddBottomSheetView extends ConsumerWidget {
  const AddBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(addBottomSheetViewModelProvider.notifier);
    var addBottomSheetState = ref.watch(addBottomSheetViewModelProvider);
    var commonBottomSheetState = ref.watch(commonBottomSheetViewModelProvider);
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
                      onPressed: addBottomSheetState.isAddable
                          ? () {
                              notifier.addTodo(
                                TodoDto(
                                  commonBottomSheetState.title,
                                  commonBottomSheetState.emergencyPoint,
                                  commonBottomSheetState.priorityPoint,
                                  commonBottomSheetState.status,
                                ),
                                context,
                              );
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: const Text('登録'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CommonBottomSheetView(
            false,
            TodoDto(
              "",
              1,
              1,
              1,
            ),
            null,
          ),
        ],
      ),
    );
  }
}
