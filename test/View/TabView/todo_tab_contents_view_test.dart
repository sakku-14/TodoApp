import 'dart:math' as math; // Debug用

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/View/TabView/todo_tab_contents_view.dart';

var notBeginCount = 20;
var tabOfNotBeginCount = find.widgetWithText(Tab, notBeginCount.toString());

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
          status: TabTitle.notBegin,
        ),
      );
    }

    return TodoListState(todoList: _todoList);
  }
}

main() {
  ProviderScope todoTabContents() {
    return ProviderScope(
      overrides: [
        todoListProvider.overrideWith(() => _MockTodoList()),
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: TabBar(tabs: [
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                  ]),
                ),
                Flexible(
                  flex: 1,
                  child: TodoTabContentsView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('指定したWidgetを表示すること', (widgetTester) async {
    // given
    // when
    await widgetTester.pumpWidget(todoTabContents());

    // then
    for (var i = 0; i < notBeginCount; i++) {
      expect(find.text('NotBeginTodoTitle$i'), findsOneWidget);
    }
  });
}
