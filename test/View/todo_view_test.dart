import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/UseCase/Dto/todo_dto.dart';
import 'package:todo_app/View/ModalBottomSheetView/edit_bottom_sheet_view.dart';
import 'package:todo_app/View/todo_view.dart';

main() {
  /// 各WidgetのKey
  final todoInput = find.byKey(todoKey);
  final editBottomSheetInput = find.byKey(editBottomSheetKey);

  ProviderScope todoView(Widget widget) {
    return ProviderScope(
      child: MaterialApp(
        home: Material(child: widget),
      ),
    );
  }

  /// TodoDtoを生成
  TodoDto createTodoDto() {
    DateTime createAt = DateTime.now();
    const String todoTitle = '単体試験用タイトル';
    const int emergencyPoint = 2;
    const int priorityPoint = 2;
    const int status = 1;

    return TodoDto(createAt, todoTitle, emergencyPoint, priorityPoint, status);
  }

  /// Todoをスライドさせる
  Future slideToRight(WidgetTester tester) async {
    // Todoをスライドして、描画完了まで待機：Offset(+右/-左, +上/-下)
    await tester.drag(todoInput, const Offset(500, 0));
    await tester.pumpAndSettle();
  }

  testWidgets('Todoが正しく生成できること', (tester) async {
    const String todoTitle = '単体試験用タイトル';

    // Test用のTodoを生成
    await tester.pumpWidget(todoView(TodoView(
      todoDto: createTodoDto(),
    )));

    expect(find.text(todoTitle), findsOneWidget); // タイトルが正しく表示されていること
    expect(find.text('2'), findsNWidgets(2)); // 緊急度×優先度を表す「2」が2つ存在すること
  });

  testWidgets('Todoを右にスライドすると削除/編集アイコンが表示されること', (tester) async {
    var todoDeleteIcon = find.widgetWithIcon(SlidableAction, Icons.delete);
    var todoEditIcon = find.widgetWithIcon(SlidableAction, Icons.edit);

    // Test用のTodoを生成
    await tester.pumpWidget(todoView(TodoView(
      todoDto: createTodoDto(),
    )));

    // Todoをスライドして、描画完了まで待機
    await slideToRight(tester);

    // 削除/編集アイコンが表示されていること
    expect(todoDeleteIcon, findsOneWidget);
    expect(todoEditIcon, findsOneWidget);
  });

  testWidgets('編集アイコンをタップすると更新用ボトムシートが表示されること', (tester) async {
    var todoEditIcon = find.widgetWithIcon(SlidableAction, Icons.edit);

    // Test用のTodoを生成
    await tester.pumpWidget(todoView(TodoView(
      todoDto: createTodoDto(),
    )));

    // Todoをスライドして、描画完了まで待機
    await slideToRight(tester);

    // 編集アイコンをタップ
    await tester.tap(todoEditIcon);
    await tester.pumpAndSettle();

    expect(editBottomSheetInput, findsOneWidget); // ボトムシートが表示されていること
    expect(find.text('Todoの更新'), findsOneWidget); // タイトルが「登録」であること
  });
}
