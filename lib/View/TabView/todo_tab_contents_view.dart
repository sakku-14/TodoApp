import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/SelectedStateTodoList/selected_state_todo_list.dart';
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
        // 未着手タブのコンテンツ
        convertToTodoViewList(
            ref.watch(selectedStateTodoListProvider(TabTitle.notBegin))),
        // 作業中タブのコンテンツ
        convertToTodoViewList(
            ref.watch(selectedStateTodoListProvider(TabTitle.progress))),
        // 保留タブのコンテンツ
        convertToTodoViewList(
            ref.watch(selectedStateTodoListProvider(TabTitle.stay))),
        // 完了タブのコンテンツ
        convertToTodoViewList(
            ref.watch(selectedStateTodoListProvider(TabTitle.complete))),
      ],
    );
  }
}
