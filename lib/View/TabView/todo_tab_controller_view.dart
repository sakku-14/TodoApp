import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/View/TabView/todo_tab_contents_view.dart';

var todoTabContentsViewKey = UniqueKey();

class TodoTabControllerView extends ConsumerWidget {
  const TodoTabControllerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 4, // タブの数
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Column(
                    children: [
                      Text(TabTitle.notBegin.tabName),
                      todoCount(ref.watch(todoListProvider
                          .select((value) => value.getNotBeginTodoList()))),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Text(TabTitle.progress.tabName),
                      todoCount(ref.watch(todoListProvider
                          .select((value) => value.getProgressTodoList()))),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Text(TabTitle.stay.tabName),
                      todoCount(ref.watch(todoListProvider
                          .select((value) => value.getStayTodoList()))),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Text(TabTitle.complete.tabName),
                      todoCount(ref.watch(todoListProvider
                          .select((value) => value.getCompleteTodoList()))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 10,
            child: TodoTabContentsView(key: todoTabContentsViewKey),
          ),
        ],
      ),
    );
  }

  Center todoCount(List<Todo>? targetList) {
    return Center(
      child: Text(
        targetList == null ? '0' : targetList.length.toString(),
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
