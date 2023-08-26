import 'dart:math' as math; // Debug用

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/TabView/todo_tab_controller_view.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

// region Debug用
var random = math.Random();
var notBeginTodoDtoList = [
  for (var i = 0; i < 16; i++) ...[
    TodoDto('notBegin', random.nextInt(3) + 1, random.nextInt(3) + 1,
        random.nextInt(4) + 1)
  ]
];
var progressTodoDtoList = [
  for (var i = 0; i < 16; i++) ...[
    TodoDto('progress', random.nextInt(3) + 1, random.nextInt(3) + 1,
        random.nextInt(4) + 1)
  ]
];
var stayTodoDtoList = [
  for (var i = 0; i < 16; i++) ...[
    TodoDto('stay', random.nextInt(3) + 1, random.nextInt(3) + 1,
        random.nextInt(4) + 1)
  ]
];
var completeTodoDtoList = [
  for (var i = 0; i < 16; i++) ...[
    TodoDto('complete', random.nextInt(3) + 1, random.nextInt(3) + 1,
        random.nextInt(4) + 1)
  ]
];
// endregion
main() {
  var tabOfNotBegin = find.widgetWithText(Tab, '未着手');
  var tabOfProgress = find.widgetWithText(Tab, '作業中');
  var tabOfStay = find.widgetWithText(Tab, '保留');
  var tabOfComplete = find.widgetWithText(Tab, '完了');

  MaterialApp todoTabControllerView() {
    return MaterialApp(
      home: Scaffold(
        body: TodoTabControllerView(
          notBeginTodoDtoList: notBeginTodoDtoList,
          progressTodoDtoList: progressTodoDtoList,
          stayTodoDtoList: stayTodoDtoList,
          completeTodoDtoList: completeTodoDtoList,
        ),
      ),
    );
  }

  testWidgets('Todoリストの各タブが表示されていること', (widgetTester) async {
    // given

    // when
    await widgetTester.pumpWidget(todoTabControllerView());

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
    await widgetTester.pumpWidget(todoTabControllerView());

    // then
    expect(todoTabContentsView, findsOneWidget);
  });
}
