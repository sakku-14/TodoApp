import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/model/model.dart';

class TodoPaneRobot {
  const TodoPaneRobot(this.tester);

  final WidgetTester tester;

  Future<void> scrollToBottom(TodoStatus status) async {
    final tab = find.widgetWithText(Tab, status.statusName);
    expect(tab, findsOneWidget);

    await tester.tap(tab);
    await tester.pumpAndSettle();

    final lastTodo = tab.last;
    final scrollArea = find.byType(Scrollable).last;

    expect(lastTodo, findsOneWidget); // WidgetTree上に存在すること
    expect(scrollArea, findsOneWidget);

    await tester.ensureVisible(lastTodo);
    await tester.pumpAndSettle();

    expect(lastTodo.hitTestable(), findsOneWidget);
  }

  Future<void> scrollToTop(TodoStatus status) async {
    final tab = find.widgetWithText(Tab, status.statusName);
    expect(tab, findsOneWidget);

    await tester.tap(tab);
    await tester.pumpAndSettle();

    final firstTodo = tab.first;
    final scrollArea = find.byType(Scrollable).last;

    expect(firstTodo, findsOneWidget); // WidgetTree上に存在すること
    expect(scrollArea, findsOneWidget);

    await tester.ensureVisible(firstTodo);
    await tester.pumpAndSettle();

    expect(firstTodo.hitTestable(), findsOneWidget);
  }

  Future<void> changeStatusTabTo(TodoStatus status) async {
    final tab = find.widgetWithText(Tab, status.statusName);
    expect(tab, findsOneWidget);
    await tester.tap(tab);
    await tester.pumpAndSettle();
  }

  Future<void> slideTodo() async {}
  Future<void> pressUpdateButton() async {}
  Future<void> pressDeleteButton() async {}
  Future<void> dragToNotBegin() async {}
  Future<void> dragToProgress() async {}
  Future<void> dragToComplete() async {}
  Future<void> dragToStay() async {}
}
