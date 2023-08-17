import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/todo_view.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

main() {
  MaterialApp todoView(Widget widget) {
    return MaterialApp(
      home: Material(child: widget),
    );
  }

  testWidgets('Todoが正しく生成できること', (tester) async {
    const String todoTitle = '単体試験用タイトル';
    const int emergencyPoint = 2;
    const int priorityPoint = 2;

    // Test用のTodoを生成
    await tester.pumpWidget(todoView(TodoView(
      todoDto: TodoDto(todoTitle, emergencyPoint, priorityPoint),
    )));

    expect(find.text(todoTitle), findsOneWidget); // タイトルが正しく表示されていること
    expect(find.text('2'), findsNWidgets(2)); // 緊急度×優先度を表す「2」が2つ存在すること
  });
}
