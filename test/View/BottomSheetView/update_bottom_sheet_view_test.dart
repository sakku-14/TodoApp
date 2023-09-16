import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/BottomSheetView/common_bottom_sheet_view.dart';
import 'package:todo_app/View/BottomSheetView/update_bottom_sheet_view.dart';

main() {
  /// 各WidgetのKey
  final editBottomSheetViewInput = find.byKey(editBottomSheetKey);
  final titleInput = find.byKey(titleKey);
  final emergencyInput = find.byKey(emergencyKey);
  final priorityInput = find.byKey(priorityKey);
  final statusInput = find.byKey(statusKey);
  final cancelButtonInput = find.byKey(cancelButtonKey);
  final editButtonInput = find.byKey(editButtonKey);

  ProviderScope editBottomSheetView(Widget widget) {
    return ProviderScope(
      child: MaterialApp(
        home: Material(child: widget),
      ),
    );
  }

  // testWidgets('キャンセルボタンを押下するとボトムシートが閉じること', (tester) async {
  //   // AddBottomSheetViewを生成
  //   await tester.pumpWidget(editBottomSheetView(UpdateBottomSheetView(
  //     todo: TodoDto(
  //       DateTime.now(),
  //       "aaa",
  //       1,
  //       1,
  //       1,
  //     ),
  //   )));
  //
  //   // キャンセルテキストボタンをタップ
  //   await tester.tap(cancelButtonInput);
  //   await tester.pumpAndSettle();
  //
  //   // ボトムシートが存在しないこと
  //   expect(editBottomSheetViewInput, findsNothing);
  // });
  //
  // testWidgets('更新ボタンを押下すると更新処理を呼び出し、かつボトムシートが閉じること', (tester) async {
  //   // AddBottomSheetViewを生成
  //   await tester.pumpWidget(editBottomSheetView(UpdateBottomSheetView(
  //     todo: TodoDto(
  //       DateTime.now(),
  //       "aaa",
  //       1,
  //       1,
  //       1,
  //     ),
  //   )));
  //   await tester.pumpAndSettle();
  //
  //   // 登録テキストボタンをタップ
  //   await tester.tap(editButtonInput);
  //   await tester.pumpAndSettle();
  //
  //   // ボトムシートが存在しないこと
  //   expect(editBottomSheetViewInput, findsNothing);
  // });
  //
  // testWidgets('更新用ボトムシートの表示項目が正しいこと', (tester) async {
  //   // EditBottomSheetViewを生成
  //   await tester.pumpWidget(editBottomSheetView(UpdateBottomSheetView(
  //     todo: TodoDto(
  //       DateTime.now(),
  //       "aaa",
  //       1,
  //       1,
  //       1,
  //     ),
  //   )));
  //   await tester.pumpAndSettle();
  //
  //   // 各項目が正しいこと
  //   // ボトムシートヘッダー部分
  //   expect(find.text('Todoの更新'), findsOneWidget);
  //   expect(find.text('キャンセル'), findsOneWidget);
  //   expect(find.text('更新'), findsOneWidget);
  //   // Todoタイトル入力用Field
  //   expect(find.byType(TextField), findsOneWidget);
  //   // 緊急度選択肢
  //   expect(find.text('緊急度'), findsOneWidget);
  //   expect(emergencyInput, findsOneWidget);
  //   // 重要度選択肢
  //   expect(find.text('重要度'), findsOneWidget);
  //   expect(priorityInput, findsOneWidget);
  //   // ステータス選択肢
  //   expect(find.text('ステータス'), findsOneWidget);
  //   expect(statusInput, findsOneWidget);
  // });
  //
  // testWidgets('タイトルが空の状態で更新ボタンを押下してもボトムシートが閉じないこと', (tester) async {
  //   // EditBottomSheetViewを生成
  //   await tester.pumpWidget(editBottomSheetView(UpdateBottomSheetView(
  //     todo: TodoDto(
  //       DateTime.now(),
  //       "aaa",
  //       1,
  //       2,
  //       3,
  //     ),
  //   )));
  //   await tester.pumpAndSettle();
  //
  //   await tester.enterText(titleInput, '');
  //   await tester.pumpAndSettle();
  //
  //   // 更新テキストボタンをタップ
  //   await tester.tap(editButtonInput);
  //   await tester.pumpAndSettle();
  //
  //   // ボトムシートが存在すること
  //   expect(editBottomSheetViewInput, findsOneWidget);
  // });
  //
  // testWidgets('タイトルが入力された状態で更新ボタンを押下するとボトムシートが閉じること', (tester) async {
  //   // EditBottomSheetViewを生成
  //   await tester.pumpWidget(editBottomSheetView(UpdateBottomSheetView(
  //     todo: TodoDto(
  //       DateTime.now(),
  //       "aaa",
  //       1,
  //       2,
  //       3,
  //     ),
  //   )));
  //   await tester.pumpAndSettle();
  //
  //   // 更新テキストボタンをタップ
  //   await tester.tap(editButtonInput);
  //   await tester.pumpAndSettle();
  //
  //   // ボトムシートが存在しないこと
  //   expect(editBottomSheetViewInput, findsNothing);
  // });
  //
  // testWidgets('更新用ボトムシートが開かれた時、Todoの情報が反映されていること', (tester) async {
  //   // AddBottomSheetViewを生成
  //   await tester.pumpWidget(editBottomSheetView(UpdateBottomSheetView(
  //     todo: TodoDto(
  //       DateTime.now(),
  //       "aaa",
  //       1,
  //       2,
  //       3,
  //     ),
  //   )));
  //   await tester.pumpAndSettle();
  //
  //   // TextFieldに「aaa」が入力されていること
  //   expect(find.text('aaa'), findsOneWidget);
  //
  //   // TODO:2023/09/09:A.Uehara:緊急度、重要度、ステータスがTodoの状態を反映して表示されるテストは、コードにテスト用コードを増やさないとできないっぽいので一旦省略
  // });
}
