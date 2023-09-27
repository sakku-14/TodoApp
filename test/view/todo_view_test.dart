import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/use_case/use_case.dart';
import 'package:todo_app/view/view.dart';

class _MockTodoList extends TodoList {
  @override
  TodoListState build() {
    return TodoListState(todoList: [
      Todo(
          createAt: DateTime(1, 2, 3, 4),
          title: 'title',
          emergencyPoint: 1,
          priorityPoint: 2,
          status: TodoStatus.notBegin)
    ]);
  }
}

main() {
  /// 各WidgetのKey
  final todoInput = find.byKey(todoKey);
  final updateBottomSheetInput = find.byKey(updateBottomSheetKey);
  final confirmDialogInput = find.byKey(confirmDialogKey);

  /// TodoDtoを生成
  TodoDto createTodoDto() {
    DateTime createAt = DateTime(1, 2, 3, 4);
    const String todoTitle = '単体試験用タイトル';
    const int emergencyPoint = 2;
    const int priorityPoint = 2;
    const TodoStatus status = TodoStatus.notBegin;
    return TodoDto(todoTitle, emergencyPoint, priorityPoint, status,
        createAt: createAt);
  }

  ProviderScope todoView(Widget widget) {
    return ProviderScope(
      overrides: [
        todoListProvider.overrideWith(() => _MockTodoList()),
      ],
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
    // given
    const String todoTitle = '単体試験用タイトル';

    // when
    // Test用のTodoを生成
    await tester.pumpWidget(todoView(TodoView(
      todoDto: createTodoDto(),
    )));

    // then
    expect(find.text(todoTitle), findsOneWidget); // タイトルが正しく表示されていること
    expect(find.text('2'), findsNWidgets(2)); // 緊急度×優先度を表す「2」が2つ存在すること
  });

  testWidgets('Todoを右にスライドすると削除/編集アイコンが表示されること', (tester) async {
    // given
    var todoDeleteIcon = find.widgetWithIcon(SlidableAction, Icons.delete);
    var todoEditIcon = find.widgetWithIcon(SlidableAction, Icons.edit);

    // when
    // Test用のTodoを生成
    await tester.pumpWidget(todoView(TodoView(
      todoDto: createTodoDto(),
    )));

    // Todoをスライドして、描画完了まで待機
    await slideToRight(tester);

    // then
    // 削除/編集アイコンが表示されていること
    expect(todoDeleteIcon, findsOneWidget);
    expect(todoEditIcon, findsOneWidget);
  });

  testWidgets('編集アイコンをタップすると更新用ボトムシートが表示されること', (tester) async {
    // given
    var todoEditIcon = find.widgetWithIcon(SlidableAction, Icons.edit);

    // when
    // Test用のTodoを生成
    await tester.pumpWidget(todoView(TodoView(
      todoDto: createTodoDto(),
    )));

    // Todoをスライドして、描画完了まで待機
    await slideToRight(tester);

    // 編集アイコンをタップ
    await tester.tap(todoEditIcon);
    await tester.pumpAndSettle();

    // then
    expect(updateBottomSheetInput, findsOneWidget); // ボトムシートが表示されていること
    expect(find.text('Todoの更新'), findsOneWidget); // タイトルが「登録」であること
  });

  testWidgets('削除アイコンをタップすると確認ダイアログが表示されること', (tester) async {
    // given
    var todoDeleteIcon = find.widgetWithIcon(SlidableAction, Icons.delete);

    // when
    // Test用のTodoを生成
    await tester.pumpWidget(todoView(TodoView(
      todoDto: createTodoDto(),
    )));

    // Todoをスライドして、描画完了まで待機
    await slideToRight(tester);

    // 編集アイコンをタップ
    await tester.tap(todoDeleteIcon);
    await tester.pumpAndSettle();

    // then
    expect(confirmDialogInput, findsOneWidget); // 確認ダイアログが表示されていること
    expect(find.text('確認'), findsOneWidget); // タイトルが正しいこと
    expect(find.text('Todoを削除しますか？'), findsOneWidget); // メッセージが正しいこと
  });
}
