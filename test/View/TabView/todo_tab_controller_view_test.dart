import 'dart:math' as math; // Debug用

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/TabView/todo_tab_controller_view.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

// region Debug用
var random = math.Random();
List<TodoDto> createNotBeginTodoDtoList(int createCount) {
  return [
    for (var i = 0; i < createCount; i++) ...[
      TodoDto(DateTime.now(), 'notBegin', random.nextInt(3) + 1,
          random.nextInt(3) + 1, random.nextInt(4) + 1)
    ]
  ];
}

List<TodoDto> createProgressTodoDtoList(int createCount) {
  return [
    for (var i = 0; i < createCount; i++) ...[
      TodoDto(DateTime.now(), 'notBegin', random.nextInt(3) + 1,
          random.nextInt(3) + 1, random.nextInt(4) + 1)
    ]
  ];
}

List<TodoDto> createStayTodoDtoList(int createCount) {
  return [
    for (var i = 0; i < createCount; i++) ...[
      TodoDto(DateTime.now(), 'notBegin', random.nextInt(3) + 1,
          random.nextInt(3) + 1, random.nextInt(4) + 1)
    ]
  ];
}

List<TodoDto> createCompleteTodoDtoList(int createCount) {
  return [
    for (var i = 0; i < createCount; i++) ...[
      TodoDto(DateTime.now(), 'notBegin', random.nextInt(3) + 1,
          random.nextInt(3) + 1, random.nextInt(4) + 1)
    ]
  ];
}

// endregion
main() {
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

  MaterialApp todoTabControllerView() {
    return MaterialApp(
      home: Scaffold(
        body: TodoTabControllerView(
          notBeginTodoDtoList: createNotBeginTodoDtoList(notBeginCount),
          progressTodoDtoList: createProgressTodoDtoList(progressCount),
          stayTodoDtoList: createStayTodoDtoList(stayCount),
          completeTodoDtoList: createCompleteTodoDtoList(completeCount),
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

  testWidgets('Todoリストの各タブに個数が表示されていること', (widgetTester) async {
    // given

    // when
    await widgetTester.pumpWidget(todoTabControllerView());

    // then
    expect(tabOfNotBeginCount, findsOneWidget);
    expect(tabOfProgressCount, findsOneWidget);
    expect(tabOfStayCount, findsOneWidget);
    expect(tabOfCompleteCount, findsOneWidget);
  });
}
