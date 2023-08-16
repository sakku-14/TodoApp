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
        trailing: Wrap(
          spacing: 8,
          children: [
            // 緊急度
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Text(emergencyPoint.toString()),
            ),
            // 重要度
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              child: Text(priorityPoint.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
