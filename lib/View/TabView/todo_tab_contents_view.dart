import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/UseCase/Dto/todo_dto.dart';
import 'package:todo_app/View/todo_view.dart';

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
        convertToTodoViewList(ref.watch(todoListProvider
            .select((value) => value.getNotBeginTodoList()))), // 未着手タブのコンテンツ
        convertToTodoViewList(ref.watch(todoListProvider
            .select((value) => value.getProgressTodoList()))), // 作業中タブのコンテンツ
        convertToTodoViewList(ref.watch(todoListProvider
            .select((value) => value.getStayTodoList()))), // 保留タブのコンテンツ
        convertToTodoViewList(ref.watch(todoListProvider
            .select((value) => value.getCompleteTodoList()))), // 完了タブのコンテンツ
      ],
    );
  }
}
