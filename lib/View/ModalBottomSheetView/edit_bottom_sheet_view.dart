import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/View/ModalBottomSheetView/common_bottom_sheet_view.dart';

import '../../ViewModel/CommonBottomSheetViewModel/common_bottom_sheet_view_model.dart';
import '../../ViewModel/Dto/todo_dto.dart';
import '../../ViewModel/EditBottomSheetViewModel/edit_bottom_sheet_view_model.dart';

// WidgetTest用Key
var editBottomSheetKey = UniqueKey();
var cancelButtonKey = UniqueKey();
var editButtonKey = UniqueKey();

class EditBottomSheetView extends ConsumerWidget {
  final TodoDto todoDto;
  const EditBottomSheetView({
    Key? key,
    required this.todoDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editBottomSheetState = ref.watch(editBottomSheetViewModelProvider);
    var editBottomSheetNotifier =
        ref.read(editBottomSheetViewModelProvider.notifier);
    var commonBottomSheetState = ref.watch(commonBottomSheetViewModelProvider);

    return SingleChildScrollView(
      child: Column(
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
                      onPressed: editBottomSheetState.isEditable
                          ? () => editBottomSheetNotifier.onUpdateTodo(
                                TodoDto(
                                  commonBottomSheetState.createAt,
                                  commonBottomSheetState.title,
                                  commonBottomSheetState.emergencyPoint,
                                  commonBottomSheetState.priorityPoint,
                                  commonBottomSheetState.status,
                                ),
                                context,
                              )
                          : null,
                      child: const Text('更新'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CommonBottomSheetView(
            true,
            todoDto,
          ),
        ],
      ),
    );
  }
}
