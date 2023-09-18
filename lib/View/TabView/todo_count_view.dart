import 'package:flutter/material.dart';

class TodoCountView extends StatelessWidget {
  const TodoCountView({super.key, required this.targetListCount});

  final int? targetListCount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: targetListCount == null
          ? Container()
          : Text(
              targetListCount.toString(),
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
    );
  }
}
