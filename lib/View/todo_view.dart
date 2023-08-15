import 'package:flutter/material.dart';

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
        title: Text(todoTitle),
        trailing: Wrap(
          spacing: 8,
          children: [
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
