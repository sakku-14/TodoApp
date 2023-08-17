import 'dart:math' as math; // Debug用

import 'package:flutter/material.dart';
import 'package:todo_app/View/todo_view.dart';

// region Debug用
var random = math.Random();
List<TodoView> todoContents = [
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
  TodoView(
      todoTitle: 'todoTitle',
      emergencyPoint: random.nextInt(3) + 1,
      priorityPoint: random.nextInt(3) + 1),
];

var todoViews = SingleChildScrollView(
  child: Column(
    children: todoContents,
  ),
);
// endregion

class TodoTabControllerView extends StatelessWidget {
  const TodoTabControllerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 4, // タブの数
      child: Column(
        children: [
          const Flexible(
            flex: 1,
            child: TabBar(
              tabs: <Widget>[
                Tab(child: Text('未着手')),
                Tab(child: Text('作業中')),
                Tab(child: Text('保留')),
                Tab(child: Text('完了')),
              ],
            ),
          ),
          Flexible(
            flex: 10,
            child: TabBarView(
              children: <Widget>[
                todoViews,
                todoViews,
                todoViews,
                todoViews,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
