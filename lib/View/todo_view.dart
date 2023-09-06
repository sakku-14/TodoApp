import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/Infrastructure/event_bus.dart';
import 'package:todo_app/View/ModalBottomSheetView/edit_bottom_sheet_view.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';
import 'package:todo_app/ViewModel/Event/edit_ready_event.dart';

/// WidgetTestで使用するKey
final todoKey = UniqueKey();

class TodoView extends ConsumerWidget {
  final TodoDto todoDto;

  const TodoView({
    super.key,
    required this.todoDto,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // TODO:23.8.16:A.Uehara:削除処理呼び出し
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              // 共通部のStateに初期値を通知する
              eventBus.fire(EditReadyEvent(todoDto));

              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: EditBottomSheetView(todoDto: todoDto),
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
    );
  }
}
