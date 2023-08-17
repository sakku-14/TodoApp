import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/todo_view.dart';

main() {
  /// 各WidgetのKey
  final todoInput = find.byKey(todoKey);

  ProviderScope todoView(Widget widget) {
    return ProviderScope(
      child: MaterialApp(
        home: Material(child: widget),
      ),
    );
  }

  /// Todoをスライドさせる
  Future slideToRight(WidgetTester tester) async {
    // Todoをスライドして、描画完了まで待機：Offset(+右/-左, +上/-下)
    await tester.drag(todoInput, const Offset(500, 0));
    await tester.pumpAndSettle();
  }

  testWidgets('Todoが正しく生成できること', (tester) async {
    const String todoTitle = '単体試験用タイトル';
    const int emergencyPoint = 2;
    const int priorityPoint = 2;

    // Test用のTodoを生成
    await tester.pumpWidget(todoView(const TodoView(
      todoTitle: todoTitle,
      emergencyPoint: emergencyPoint,
      priorityPoint: priorityPoint,
    )));

    expect(find.text(todoTitle), findsOneWidget); // タイトルが正しく表示されていること
    expect(find.text('2'), findsNWidgets(2)); // 緊急度×優先度を表す「2」が2つ存在すること
  });

  testWidgets('Todoを右にスライドすると削除/編集アイコンが表示されタップできること', (tester) async {
    var todoDeleteIcon = find.widgetWithIcon(SlidableAction, Icons.delete);
    var todoEditIcon = find.widgetWithIcon(SlidableAction, Icons.edit);

    const String todoTitle = '単体試験用タイトル';
    const int emergencyPoint = 2;
    const int priorityPoint = 2;

    // Test用のTodoを生成
    await tester.pumpWidget(todoView(const TodoView(
      todoTitle: todoTitle,
      emergencyPoint: emergencyPoint,
      priorityPoint: priorityPoint,
    )));

    // Todoをスライドして、描画完了まで待機
    await slideToRight(tester);

    // 削除アイコンが表示されていて、タップできること
    expect(todoDeleteIcon, findsOneWidget);
    await tester.tap(todoDeleteIcon);
    await tester.pumpAndSettle();

    // Todoをスライドして、描画完了まで待機
    await slideToRight(tester);

    // 編集アイコンが表示されていて、タップできること
    expect(todoEditIcon, findsOneWidget);
    await tester.tap(todoEditIcon);
  });
}
