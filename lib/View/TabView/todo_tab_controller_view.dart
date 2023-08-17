import 'dart:math' as math; // Debug用

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

class TodoTabControllerView extends StatefulWidget {
  const TodoTabControllerView({
    super.key,
    required this.parentColumnKey,
    required this.todoTabControllerRatio,
  });

  final GlobalKey parentColumnKey;
  final double todoTabControllerRatio;

  @override
  State<TodoTabControllerView> createState() => _TodoTabControllerViewState();
}

class _TodoTabControllerViewState extends State<TodoTabControllerView> {
  double parentHeight = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox? parentColumnBox = widget.parentColumnKey.currentContext
          ?.findRenderObject() as RenderBox?;
      if (parentColumnBox != null) {
        setState(() {
          parentHeight = parentColumnBox!.size.height;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var availableHeight = parentHeight * widget.todoTabControllerRatio;
    if (availableHeight <= 0) availableHeight = 0;

    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 4, // タブの数
      child: SizedBox(
        height: availableHeight,
        child: Column(
          children: [
            SizedBox(
              height: availableHeight * 0.07,
              child: const TabBar(
                tabs: <Widget>[
                  Tab(child: Text('未着手')),
                  Tab(child: Text('作業中')),
                  Tab(child: Text('保留')),
                  Tab(child: Text('完了')),
                ],
              ),
            ),
            availableHeight == 0
                ? Container()
                : SizedBox(
                    width: double.infinity,
                    height: availableHeight * 0.93,
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
      ),
    );
  }
}
