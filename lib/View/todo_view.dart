import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

/// WidgetTestで使用するKey
final todoKey = UniqueKey();

class TodoView extends StatelessWidget {
  final TodoDto todoDto;

  const TodoView({
    super.key,
    required this.todoDto,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
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
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: isLandscape
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xfff7a3a3),
                      ),
                    ),
                    Container(
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xfff7d092),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: isLandscape
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
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
                          color: Colors.transparent,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
