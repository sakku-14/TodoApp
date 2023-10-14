import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/view/todo_view.dart';

class TodoPaneRobot {
  const TodoPaneRobot(this.tester);

  final WidgetTester tester;

  Future<void> scrollToBottom({TodoStatus status = TodoStatus.notBegin}) async {
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

  Future<void> scrollToTop({TodoStatus status = TodoStatus.notBegin}) async {
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

  /// isToLeft = falseの時は機能していないので注意！！！（このチケット完了までに直します）
  Future<void> slideTodo({int index = 0, bool isToRight = true}) async {
    final todo = find.byKey(todoKey).at(index);
    expect(todo, findsOneWidget);

    // Todoをスライドして、描画完了まで待機：Offset(+右/-左, +上/-下)
    await tester.drag(todo, Offset(isToRight ? 100 : -100, 0));
    await tester.pumpAndSettle();
  }

  Future<void> pressUpdateButton() async {}
  Future<void> pressDeleteButton() async {}

  Future<void> dragToNotBegin() async {}
  Future<void> dragToProgress() async {}
  Future<void> dragToComplete() async {}
  Future<void> dragToStay() async {}
}
