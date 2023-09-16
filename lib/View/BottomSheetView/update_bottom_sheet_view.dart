import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Model/EditTodo/edit_todo.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/UseCase/UpdateTodoUseCase/update_todo_use_case.dart';
import 'package:todo_app/View/BottomSheetView/common_bottom_sheet_view.dart';

import '../../UseCase/Dto/todo_dto.dart';

// WidgetTest用Key
var editBottomSheetKey = UniqueKey();
var cancelButtonKey = UniqueKey();
var editButtonKey = UniqueKey();

class UpdateBottomSheetView extends ConsumerStatefulWidget {
  final DateTime createAt;
  const UpdateBottomSheetView({
    Key? key,
    required this.createAt,
  }) : super(key: key);

  @override
  ConsumerState<UpdateBottomSheetView> createState() =>
      _EditBottomSheetViewState();
}

class _EditBottomSheetViewState extends ConsumerState<UpdateBottomSheetView> {
  @override
  void initState() {
    super.initState();
    Future(() {
      Todo todo = ref.watch(todoListProvider).getTodo(widget.createAt);
      ref.read(editTodoProvider.notifier).setInitialValue(todo.createAt,
          todo.title, todo.emergencyPoint, todo.priorityPoint, todo.status);
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(editTodoProvider);

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
                      onPressed: ref.watch(editTodoProvider).canSubmit()
                          ? () {
                              // Todo更新処理呼び出し
                              ref
                                  .watch(updateTodoUseCaseProvider)
                                  .execute(TodoDto(
                                    state.title,
                                    state.emergencyPoint,
                                    state.primaryPoint,
                                    state.tabStatus,
                                    createAt: state.createAt,
                                  ));
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: const Text('更新'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const CommonBottomSheetView(),
        ],
      ),
    );
  }
}
