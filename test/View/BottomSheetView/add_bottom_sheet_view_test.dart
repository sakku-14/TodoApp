import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/BottomSheetView/add_bottom_sheet_view.dart';
import 'package:todo_app/View/BottomSheetView/common_bottom_sheet_view.dart';

main() {
  /// 各WidgetのKey
  final addBottomSheetViewInput = find.byKey(addBottomSheetKey);
  final titleInput = find.byKey(titleKey);
  final emergencyInput = find.byKey(emergencyKey);
  final priorityInput = find.byKey(priorityKey);
  final statusInput = find.byKey(statusKey);
  final cancelButtonInput = find.byKey(cancelButtonKey);
  final addButtonInput = find.byKey(addButtonKey);

  ProviderScope addBottomSheetView(Widget widget) {
    return ProviderScope(
      child: MaterialApp(
        home: Material(child: widget),
      ),
    );
  }

  testWidgets('登録用ボトムシートの表示項目が正しいこと', (tester) async {
    // AddBottomSheetViewを生成
    await tester.pumpWidget(addBottomSheetView(const AddBottomSheetView()));
    await tester.pumpAndSettle();

    // 各項目が正しいこと
    // ボトムシートヘッダー部分
    expect(find.text('Todoの登録'), findsOneWidget);
    expect(find.text('キャンセル'), findsOneWidget);
    expect(find.text('登録'), findsOneWidget);
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

  testWidgets('キャンセルボタンを押下するとボトムシートが閉じること', (tester) async {
    // AddBottomSheetViewを生成
    await tester.pumpWidget(addBottomSheetView(const AddBottomSheetView()));

    // キャンセルテキストボタンをタップ
    await tester.tap(cancelButtonInput);
    await tester.pumpAndSettle();

    // ボトムシートが存在しないこと
    expect(addBottomSheetViewInput, findsNothing);
  });

  testWidgets('タイトルが空の状態で登録ボタンを押下してもボトムシートが閉じないこと', (tester) async {
    // AddBottomSheetViewを生成
    await tester.pumpWidget(addBottomSheetView(const AddBottomSheetView()));

    // 登録テキストボタンをタップ
    await tester.tap(addButtonInput);
    await tester.pumpAndSettle();

    // ボトムシートが存在すること
    expect(addBottomSheetViewInput, findsOneWidget);
  });

  testWidgets('タイトルが入力された状態で登録ボタンを押下するとボトムシートが閉じること', (tester) async {
    // AddBottomSheetViewを生成
    await tester.pumpWidget(addBottomSheetView(const AddBottomSheetView()));

    // titleを入力
    await tester.enterText(titleInput, 'text');
    await tester.pumpAndSettle();

    // 登録テキストボタンをタップ
    await tester.tap(addButtonInput);
    await tester.pumpAndSettle();

    // ボトムシートが存在しないこと
    expect(addBottomSheetViewInput, findsNothing);
  });
}
