import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/ModalBottomSheetView/common_bottom_sheet_view.dart';
import 'package:todo_app/View/ModalBottomSheetView/edit_bottom_sheet_view.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

main() {
  /// 各WidgetのKey
  final editBottomSheetViewInput = find.byKey(editBottomSheetKey);
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

  testWidgets('キャンセルボタンを押下するとボトムシートが閉じること', (tester) async {
    // AddBottomSheetViewを生成
    await tester.pumpWidget(editBottomSheetView(EditBottomSheetView(
      todoDto: TodoDto(
        "aaa",
        1,
        1,
        1,
      ),
    )));

    // キャンセルテキストボタンをタップ
    await tester.tap(cancelButtonInput);
    await tester.pumpAndSettle();

    // ボトムシートが存在しないこと
    expect(editBottomSheetViewInput, findsNothing);
  });

  testWidgets('更新ボタンを押下すると更新処理を呼び出し、かつボトムシートが閉じること', (tester) async {
    // AddBottomSheetViewを生成
    await tester.pumpWidget(editBottomSheetView(EditBottomSheetView(
      todoDto: TodoDto(
        "aaa",
        1,
        1,
        1,
      ),
    )));

    // 登録テキストボタンをタップ
    await tester.tap(editButtonInput);
    await tester.pumpAndSettle();

    // ボトムシートが存在しないこと
    expect(editBottomSheetViewInput, findsNothing);
  });

  testWidgets('更新用ボトムシートの表示項目が正しいこと', (tester) async {
    // EditBottomSheetViewを生成
    await tester.pumpWidget(editBottomSheetView(EditBottomSheetView(
      todoDto: TodoDto(
        "aaa",
        1,
        1,
        1,
      ),
    )));
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
}
