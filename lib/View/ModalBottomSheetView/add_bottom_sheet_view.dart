import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Domain/EditTodo/edit_todo.dart';
import 'package:todo_app/UseCase/AddTodoUseCase/add_todo_use_case.dart';
import 'package:todo_app/View/ModalBottomSheetView/common_bottom_sheet_view.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

// WidgetTest用Key
var addBottomSheetKey = UniqueKey();
var cancelButtonKey = UniqueKey();
var addButtonKey = UniqueKey();

class AddBottomSheetView extends ConsumerWidget {
  const AddBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(editTodoProvider);
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
                      onPressed: state.canSubmit()
                          ? () {
                              // Todo登録処理呼び出し
                              var result = ref
                                  .read(addTodoUseCaseProvider)
                                  .execute(TodoDto(
                                      state.title,
                                      state.emergencyPoint,
                                      state.primaryPoint,
                                      state.tabStatus));
                              if (!result) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Filed Add Todo'),
                                  ),
                                );
                              }
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
          CommonBottomSheetView(),
        ],
      ),
    );
  }
}
