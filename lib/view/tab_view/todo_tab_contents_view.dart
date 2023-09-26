import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../model/model.dart';
import '../../use_case/use_case.dart';
import '../view.dart';

class TodoTabContentsView extends ConsumerWidget {
  const TodoTabContentsView({
    super.key,
  });

  // Widgetに切り出したい
  Widget convertToTodoViewList(List<Todo>? todoList) {
    var todoContents = (todoList == null || todoList.isEmpty)
        ? [Container()]
        : todoList
            .map((e) => TodoView(
                    todoDto: TodoDto(
                  e.title,
                  e.emergencyPoint,
                  e.priorityPoint,
                  e.status,
                  createAt: e.createAt,
                )))
            .toList();
    var todoViews = SingleChildScrollView(
      child: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: Column(
          children: todoContents,
        ),
      ),
    );
    return todoViews;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TabBarView(
      children: <Widget>[
        // 未着手タブのコンテンツ
        convertToTodoViewList(
            ref.watch(selectedStateTodoListProvider(TodoStatus.notBegin))),
        // 作業中タブのコンテンツ
        convertToTodoViewList(
            ref.watch(selectedStateTodoListProvider(TodoStatus.progress))),
        // 保留タブのコンテンツ
        convertToTodoViewList(
            ref.watch(selectedStateTodoListProvider(TodoStatus.stay))),
        // 完了タブのコンテンツ
        convertToTodoViewList(
            ref.watch(selectedStateTodoListProvider(TodoStatus.complete))),
      ],
    );
  }
}
