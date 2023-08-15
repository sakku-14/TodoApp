import 'package:flutter/material.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Todoのタイトル'),
        trailing: Wrap(
          spacing: 8,
          children: [
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 40,
              child: Text('1'),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 40,
              child: Text('2'),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
