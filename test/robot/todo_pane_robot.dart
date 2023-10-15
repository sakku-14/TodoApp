import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/view/confirm_dialog_view.dart';
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

  Future<void> pressUpdateButton() async {
    final todoEditIcon = find.widgetWithIcon(SlidableAction, Icons.edit);
    expect(todoEditIcon, findsOneWidget);

    await tester.tap(todoEditIcon);
    await tester.pumpAndSettle();
    expect(todoEditIcon, findsNothing);
  }

  Future<void> pressDeleteButton() async {
    final todoDeleteIcon = find.widgetWithIcon(SlidableAction, Icons.delete);
    expect(todoDeleteIcon, findsOneWidget);

    await tester.tap(todoDeleteIcon);
    await tester.pumpAndSettle();
    expect(todoDeleteIcon, findsNothing);
  }

  Future<void> pressDeleteOkButton() async {
    final okButton = find.byKey(confirmOkKey);
    expect(okButton, findsOneWidget);

    await tester.tap(okButton);
    await tester.pumpAndSettle();
  }

  Future<void> pressDeleteCancelButton() async {
    final cancelButton = find.byKey(confirmCancelKey);
    expect(cancelButton, findsOneWidget);

    await tester.tap(cancelButton);
    await tester.pumpAndSettle();
  }

  Future<void> dragFromTo(
      {required TodoStatus destStatus, int todoIndex = 0}) async {
    final destTab = find.widgetWithText(Tab, destStatus.statusName);
    expect(destTab, findsOneWidget);

    final todo = find.byKey(todoKey).at(todoIndex);
    expect(todo, findsOneWidget);

    // ドラッグ
    final firstLocation = tester.getCenter(todo);
    final gesture = await tester.startGesture(firstLocation);
    await tester.pump(const Duration(seconds: 1));

    // ドラッグしながら移動
    await gesture.moveTo(tester.getCenter(destTab));
    await tester.pumpAndSettle();

    // ドロップ
    await gesture.up();
    await tester.pumpAndSettle();

    await tester.tap(destTab);
    await tester.pumpAndSettle();
    expect(todo, findsOneWidget); // DD対象のTodoが作業中タブ内に存在すること
  }
}
