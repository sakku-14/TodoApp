import 'package:flutter/material.dart';

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
    return Card(
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
    );
  }
}
