import 'package:flutter/material.dart';

class TodoCountView extends StatelessWidget {
  const TodoCountView({super.key, required this.targetListCount});

  final int? targetListCount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        targetListCount == null ? '0' : targetListCount.toString(),
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
