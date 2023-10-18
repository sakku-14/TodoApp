import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/view/view.dart';

import '../main.dart';
import '../use_case/use_case.dart';

/// WidgetTestで使用するKey
final todoKey = UniqueKey();
final todoTitleKey = UniqueKey();
final todoEmergencyPointKey = UniqueKey();
final todoPriorityPointKey = UniqueKey();

class TodoView extends ConsumerWidget {
  final TodoDto todoDto;

  const TodoView({
    Key? key,
    required this.todoDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape; // 縦or横を取得
    return Slidable(
      key: todoKey,
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              var isOk = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return const ConfirmDialogView(
                    message: 'Todoを削除しますか？',
                  );
                },
              );
              var message = 'Todoを削除しました。';
              if (isOk!) {
                if (!await ref
                    .read(deleteTodoUseCaseProvider)
                    .execute(todoDto)) {
                  message = 'Todoを削除できませんでした。';
                }
                showSnackBar(message);
              }
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: UpdateBottomSheetView(createAt: todoDto.createAt!),
                  );
                },
              );
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: LongPressDraggable(
        data: TodoDto(
          createAt: todoDto.createAt,
          todoDto.title,
          todoDto.emergencyPoint,
          todoDto.priorityPoint,
          todoDto.status,
        ),
        // ドラッグ中の見た目
        feedback: WhileDraggingTodoView(todoDto: todoDto),
        child: Card(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black38, //色
              width: 0.5, //太さ
            ),
          ),
          child: ListTile(
            title: Text(key: todoTitleKey, todoDto.title),
            trailing: FractionallySizedBox(
              widthFactor: 0.2,
              child: Center(
                child: Row(
                  mainAxisAlignment: isLandscape
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xfff7a3a3),
                      ),
                      child: Center(
                        child: Text(
                          key: todoEmergencyPointKey,
                          todoDto.emergencyPoint.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xfff7d092),
                      ),
                      child: Center(
                        child: Text(
                          key: todoPriorityPointKey,
                          todoDto.priorityPoint.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessengerState scaffoldMessengerState = scaffoldKey.currentState!;
    scaffoldMessengerState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
