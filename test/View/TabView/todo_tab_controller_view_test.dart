import 'dart:math' as math; // Debug用

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/Entities/TodoStatus/todo_status.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/View/TabView/todo_tab_controller_view.dart';

// region Debug用
var notBeginCount = 20;
var progressCount = 15;
var stayCount = 10;
var completeCount = 5;

var tabOfNotBegin = find.widgetWithText(Tab, '未着手');
var tabOfNotBeginCount = find.widgetWithText(Tab, notBeginCount.toString());
var tabOfProgress = find.widgetWithText(Tab, '作業中');
var tabOfProgressCount = find.widgetWithText(Tab, progressCount.toString());
var tabOfStay = find.widgetWithText(Tab, '保留');
var tabOfStayCount = find.widgetWithText(Tab, stayCount.toString());
var tabOfComplete = find.widgetWithText(Tab, '完了');
var tabOfCompleteCount = find.widgetWithText(Tab, completeCount.toString());

class _MockTodoList extends TodoList {
  final List<Todo> _todoList = <Todo>[];
  final _random = math.Random();

  @override
  TodoListState build() {
    for (int i = 0; i < notBeginCount; i++) {
      _todoList.add(
        Todo(
          createAt: DateTime.now(),
          title: 'NotBeginTodoTitle$i',
          emergencyPoint: _random.nextInt(3) + 1,
          priorityPoint: _random.nextInt(3) + 1,
          status: TodoStatus.notBegin,
        ),
      );
    }

    for (int i = 0; i < progressCount; i++) {
      _todoList.add(
        Todo(
          createAt: DateTime.now(),
          title: 'ProgressTodoTitle$i',
          emergencyPoint: _random.nextInt(3) + 1,
          priorityPoint: _random.nextInt(3) + 1,
          status: TodoStatus.progress,
        ),
      );
    }

    for (int i = 0; i < stayCount; i++) {
      _todoList.add(
        Todo(
          createAt: DateTime.now(),
          title: 'StayTodoTitle$i',
          emergencyPoint: _random.nextInt(3) + 1,
          priorityPoint: _random.nextInt(3) + 1,
          status: TodoStatus.stay,
        ),
      );
    }

    for (int i = 0; i < completeCount; i++) {
      _todoList.add(
        Todo(
          createAt: DateTime.now(),
          title: 'CompleteTodoTitle$i',
          emergencyPoint: _random.nextInt(3) + 1,
          priorityPoint: _random.nextInt(3) + 1,
          status: TodoStatus.complete,
        ),
      );
    }

    return TodoListState(todoList: _todoList);
  }
}

// endregion

main() {
  ProviderScope todoTabControllerView(Widget widget) {
    return ProviderScope(
      overrides: [
        todoListProvider.overrideWith(() => _MockTodoList()),
      ],
      child: MaterialApp(
        home: Material(
          child: widget,
        ),
      ),
    );
  }

  testWidgets('Todoリストの各タブが表示されていること', (widgetTester) async {
    // given
    // when
    await widgetTester
        .pumpWidget(todoTabControllerView(const TodoTabControllerView()));

    // then
    expect(tabOfNotBegin, findsOneWidget);
    expect(tabOfProgress, findsOneWidget);
    expect(tabOfStay, findsOneWidget);
    expect(tabOfComplete, findsOneWidget);
  });

  testWidgets('TodoリストのViewが表示されていること', (widgetTester) async {
    // given
    var todoTabContentsView = find.byKey(todoTabContentsViewKey);

    // when
    await widgetTester
        .pumpWidget(todoTabControllerView(const TodoTabControllerView()));

    // then
    expect(todoTabContentsView, findsOneWidget);
  });

  testWidgets('Todoリストの各タブに個数が表示されていること', (widgetTester) async {
    // given

    // when
    await widgetTester
        .pumpWidget(todoTabControllerView(const TodoTabControllerView()));

    // then
    expect(tabOfNotBeginCount, findsOneWidget);
    expect(tabOfProgressCount, findsOneWidget);
    expect(tabOfStayCount, findsOneWidget);
    expect(tabOfCompleteCount, findsOneWidget);
  });
}
