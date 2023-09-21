import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/UseCase/DeleteTodoUseCase/delete_todo_use_case.dart';
import 'package:todo_app/UseCase/Dto/todo_dto.dart';
import 'package:todo_app/View/BottomSheetView/update_bottom_sheet_view.dart';
import 'package:todo_app/View/confirm_dialog_view.dart';

import '../main.dart';

/// WidgetTestで使用するKey
final todoKey = UniqueKey();

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
    final screenWidth = MediaQuery.of(context).size.width; // 画面幅の取得
    return Slidable(
      key: const ValueKey(0),
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
        feedback: Material(
          child: Container(
            width: screenWidth * 0.8, // 幅を設定
            height: 50, // 高さを設定
            decoration: BoxDecoration(
              // 半透明の背景色
              border: Border.all(
                color: Colors.black.withOpacity(0.5), // ボーダーラインの色
                width: 0.5, // ボーダーラインの太さ
              ),
            ),
            child: Center(
              child: Text(
                todoDto.title, // 表示するテキスト
                style: const TextStyle(
                  fontSize: 16, // テキストのフォントサイズ
                  color: Colors.black, // テキストの色
                ),
              ),
            ),
          ),
        ),
        child: Card(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black38, //色
              width: 0.5, //太さ
            ),
          ),
          child: ListTile(
            key: todoKey,
            title: Text(todoDto.title),
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
