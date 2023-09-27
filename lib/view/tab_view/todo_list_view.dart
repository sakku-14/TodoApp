import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/model/model.dart';

import '../../use_case/use_case.dart';
import '../view.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView(this.status, {super.key});

  final TodoStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(selectedStateTodoListProvider(status));
    return SingleChildScrollView(
      child: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: Column(
          children: (todoList == null || todoList.isEmpty)
              ? [Container()]
              : todoList
                  .map(
                    (e) => TodoView(
                      todoDto: TodoDto(
                        e.title,
                        e.emergencyPoint,
                        e.priorityPoint,
                        e.status,
                        createAt: e.createAt,
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
