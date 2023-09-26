import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/Entities/TodoStatus/todo_status.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/View/BottomSheetView/common_bottom_sheet_view.dart';
import 'package:todo_app/View/BottomSheetView/update_bottom_sheet_view.dart';

DateTime createAt = DateTime.now();

class _MockTodoList extends TodoList {
  @override
  TodoListState build() {
    return TodoListState(
      todoList: [
        Todo(
          createAt: createAt,
          title: 'title',
          emergencyPoint: 1,
          priorityPoint: 2,
          status: TodoStatus.notBegin,
        ),
      ],
    );
  }
}

main() {
  createAt = DateTime.now();

  /// 各WidgetのKey
  final editBottomSheetViewInput = find.byKey(updateBottomSheetKey);
  final titleInput = find.byKey(titleKey);
  final emergencyInput = find.byKey(emergencyKey);
  final priorityInput = find.byKey(priorityKey);
  final statusInput = find.byKey(statusKey);
  final cancelButtonInput = find.byKey(cancelButtonKey);
  final editButtonInput = find.byKey(updateButtonKey);

  ProviderScope updateBottomSheetView(Widget widget) {
    return ProviderScope(
      overrides: [
        todoListProvider.overrideWith(() => _MockTodoList()),
      ],
      child: MaterialApp(
        home: Material(child: widget),
      ),
    );
  }

  testWidgets('キャンセルボタンを押下するとボトムシートが閉じること', (tester) async {
    // UpdateBottomSheetViewを生成
    await tester.pumpWidget(
        updateBottomSheetView(UpdateBottomSheetView(createAt: createAt)));
    await tester.pumpAndSettle();

    // キャンセルテキストボタンをタップ
    await tester.tap(cancelButtonInput);
    await tester.pumpAndSettle();

    // ボトムシートが存在しないこと
    expect(editBottomSheetViewInput, findsNothing);
  });

  testWidgets('更新ボタンを押下するとボトムシートが閉じること', (tester) async {
    // UpdateBottomSheetViewを生成
    await tester.pumpWidget(
        updateBottomSheetView(UpdateBottomSheetView(createAt: createAt)));
    await tester.pumpAndSettle();

    // 登録テキストボタンをタップ
    await tester.tap(editButtonInput);
    await tester.pumpAndSettle();

    // ボトムシートが存在しないこと
    expect(editBottomSheetViewInput, findsNothing);
  });

  testWidgets('更新用ボトムシートの表示項目が正しいこと', (tester) async {
    // UpdateBottomSheetViewを生成
    await tester.pumpWidget(
        updateBottomSheetView(UpdateBottomSheetView(createAt: createAt)));
    await tester.pumpAndSettle();

    // 各項目が正しいこと
    // ボトムシートヘッダー部分
    expect(find.text('Todoの更新'), findsOneWidget);
    expect(find.text('キャンセル'), findsOneWidget);
    expect(find.text('更新'), findsOneWidget);
    // Todoタイトル入力用Field
    expect(find.byType(TextField), findsOneWidget);
    // 緊急度選択肢
    expect(find.text('緊急度'), findsOneWidget);
    expect(emergencyInput, findsOneWidget);
    // 重要度選択肢
    expect(find.text('重要度'), findsOneWidget);
    expect(priorityInput, findsOneWidget);
    // ステータス選択肢
    expect(find.text('ステータス'), findsOneWidget);
    expect(statusInput, findsOneWidget);
  });

  testWidgets('タイトルが空の状態で更新ボタンを押下してもボトムシートが閉じないこと', (tester) async {
    // EditBottomSheetViewを生成
    await tester.pumpWidget(
        updateBottomSheetView(UpdateBottomSheetView(createAt: createAt)));
    await tester.pumpAndSettle();

    await tester.enterText(titleInput, '');
    await tester.pumpAndSettle();

    // 更新テキストボタンをタップ
    await tester.tap(editButtonInput);
    await tester.pumpAndSettle();

    // ボトムシートが存在すること
    expect(editBottomSheetViewInput, findsOneWidget);
  });

  testWidgets('タイトルが入力された状態で更新ボタンを押下するとボトムシートが閉じること', (tester) async {
    // EditBottomSheetViewを生成
    await tester.pumpWidget(
        updateBottomSheetView(UpdateBottomSheetView(createAt: createAt)));
    await tester.pumpAndSettle();

    // 更新テキストボタンをタップ
    await tester.tap(editButtonInput);
    await tester.pumpAndSettle();

    // ボトムシートが存在しないこと
    expect(editBottomSheetViewInput, findsNothing);
  });

  testWidgets('更新用ボトムシートが開かれた時、Todoの情報が反映されていること', (tester) async {
    // Providerスコープの設定
    final container = ProviderContainer();

    // AddBottomSheetViewを生成
    await tester.pumpWidget(
        updateBottomSheetView(UpdateBottomSheetView(createAt: createAt)));
    await tester.pumpAndSettle();

    // 各CupertinoSegmentedControlの選択状態（groupValue）の値を取得
    final emergencyPointSegmentedControl =
        tester.widget<CupertinoSegmentedControl>(emergencyInput);
    final primaryPointSegmentedControl =
        tester.widget<CupertinoSegmentedControl>(priorityInput);
    final statusPointSegmentedControl =
        tester.widget<CupertinoSegmentedControl>(statusInput);
    final emergencyPointGroupValue = emergencyPointSegmentedControl.groupValue;
    final primaryPointGroupValue = primaryPointSegmentedControl.groupValue;
    final statusPointGroupValue = statusPointSegmentedControl.groupValue;

    // TextFieldに「title」が入力されていること
    expect(find.text('title'), findsOneWidget);

    // groupValueの値を検証
    expect(emergencyPointGroupValue, 1);
    expect(primaryPointGroupValue, 2);
    expect(statusPointGroupValue, TodoStatus.notBegin);

    // Providerスコープのクリーンアップ
    container.dispose();
  });
}
