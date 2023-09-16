import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/ModalBottomSheetView/add_bottom_sheet_view.dart';
import 'package:todo_app/View/main_view.dart';
import 'package:todo_app/View/sort_combo_box_view.dart';

main() {
  /// 各WidgetのKey
  final sortComboBoxInput = find.byKey(sortComboBoxKey);
  final addBottomSheetInput = find.byKey(addBottomSheetKey);

  ProviderScope mainView(Widget widget) {
    return ProviderScope(
      child: MaterialApp(
        home: widget,
      ),
    );
  }

  group('Title', () {
    testWidgets('アップバーにタイトルが表示されていること', (tester) async {
      // given
      await tester.pumpWidget(mainView(const MainView()));
      final appBarTextFinder = find.text('Todoアプリ');

      // when
      // then
      expect(appBarTextFinder, findsOneWidget);
    });
  });

  group('SortComboBox', () {
    testWidgets('ソート用ComboBoxが表示されていること', (tester) async {
      // given
      await tester.pumpWidget(mainView(const MainView()));

      // when
      // then
      expect(sortComboBoxInput, findsOneWidget);
    });

    testWidgets('ソート用ComboBoxの値が切り替わること', (tester) async {
      const String editDate = '登録日時';
      const String emergencyPriority = '緊急度×重要度';

      await tester.pumpWidget(mainView(const MainView()));

      // 「登録日時」を持つWidgetが1つあること
      expect((tester.widget(sortComboBoxInput) as DropdownButton).value,
          equals(editDate));

      // ドロップダウンをtapして描画(開くまで)を待つ
      await tester.tap(find.text(editDate));
      await tester.pumpAndSettle();

      // 「緊急度×重要度」をtapして描画(閉じるまで)を待つ
      await tester.tap(find.text(emergencyPriority).last);
      await tester.pumpAndSettle();

      // 「緊急度×重要度」を持つWidgetが1つあること
      expect((tester.widget(sortComboBoxInput) as DropdownButton).value,
          equals(emergencyPriority));
    });
  });

  group('Todoリストタブ', () {
    testWidgets('ステータス毎にタブが4つ表示されていること', (tester) async {
      // given
      var notBeginTab = find.widgetWithText(Tab, '未着手');
      var progressTab = find.widgetWithText(Tab, '作業中');
      var stayTab = find.widgetWithText(Tab, '保留');
      var completeTab = find.widgetWithText(Tab, '完了');

      // when
      await tester.pumpWidget(mainView(const MainView()));

      // then
      expect(notBeginTab, findsOneWidget);
      expect(progressTab, findsOneWidget);
      expect(stayTab, findsOneWidget);
      expect(completeTab, findsOneWidget);
    });
  });

  group('Todo追加ボタン', () {
    testWidgets('Todo追加ボタンを押下すると、登録用ボトムシートが表示されること', (tester) async {
      // given
      await tester.pumpWidget(mainView(const MainView()));
      var floatingActionButton =
          find.widgetWithIcon(FloatingActionButton, Icons.add);

      // デフォルト表示として、Todo追加ボタンが存在していること
      expect(floatingActionButton, findsOneWidget);

      // when
      await tester.tap(floatingActionButton); // Todo追加ボタンを押下する
      await tester.pumpAndSettle();

      // then
      expect(addBottomSheetInput, findsOneWidget); // ボトムシートが表示されていること
      expect(find.text('Todoの登録'), findsOneWidget); // タイトルが「登録」であること
    });
  });
}
