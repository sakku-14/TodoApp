import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/View/edit_bottom_sheet_view.dart';

/// WidgetTestで使用するKey
final todoKey = UniqueKey();

class TodoView extends StatelessWidget {
  final String todoTitle;
  final int emergencyPoint;
  final int priorityPoint;

  const TodoView({
    super.key,
    required this.todoTitle,
    required this.emergencyPoint,
    required this.priorityPoint,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          // A SlidableAction can have an icon and/or a label.
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
              // TODO:23.8.16:A.Uehara:更新処理呼び出し
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const EditBottomSheetView();
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
          title: Text(todoTitle),
          trailing: FractionallySizedBox(
            widthFactor: 0.15,
            heightFactor: 0.7,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Wrap(
                spacing: 5,
                children: [
                  // 緊急度
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.redAccent,
                    ),
                    child: Text(
                      emergencyPoint.toString(),
                    ),
                  ),
                  // 重要度
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orangeAccent,
                    ),
                    child: Text(priorityPoint.toString()),
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
