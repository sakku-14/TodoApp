import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/TabView/todo_tab_contents_view.dart';

import 'todo_tab_controller_view_test.dart';

main() {
  MaterialApp todoTabContents(
      Widget first, Widget second, Widget third, Widget forth) {
    return MaterialApp(
      home: Scaffold(
        body: DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Column(
            children: [
              const Flexible(
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
                child: TodoTabContentsView(
                  notBeginTodoDtoList: notBeginTodoDtoList,
                  progressTodoDtoList: progressTodoDtoList,
                  stayTodoDtoList: stayTodoDtoList,
                  completeTodoDtoList: completeTodoDtoList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  testWidgets('指定したWidgetを表示すること', (widgetTester) async {
    // given
    const first = Text('first');
    const second = Text('second');
    const third = Text('third');
    const forth = Text('forth');
    var firstWidget = find.text('notBegin');

    // when
    await widgetTester.pumpWidget(todoTabContents(first, second, third, forth));

    // then
    expect(firstWidget, findsAtLeastNWidgets(1));
  });
}
