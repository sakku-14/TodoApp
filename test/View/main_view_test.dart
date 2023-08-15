import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/main_view.dart';

main() {
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
      expect(find.byKey(const Key('dropdown')), findsOneWidget);
    });

    testWidgets('ソート用ComboBoxの値が切り替わること', (tester) async {
      const String editDate = '登録日時';
      const String emergencyPriority = '緊急度×重要度';

      await tester.pumpWidget(mainView(const MainView()));

      // 「登録日時」を持つWidgetが1つあること
      expect(
          (tester.widget(find.byKey(const Key('dropdown'))) as DropdownButton)
              .value,
          equals(editDate));

      // ドロップダウンをtapして描画(開くまで)を待つ
      await tester.tap(find.text(editDate));
      await tester.pumpAndSettle();

      // 「緊急度×重要度」をtapして描画(閉じるまで)を待つ
      await tester.tap(find.text(emergencyPriority).last);
      await tester.pumpAndSettle();

      // 「緊急度×重要度」を持つWidgetが1つあること
      expect(
          (tester.widget(find.byKey(const Key('dropdown'))) as DropdownButton)
              .value,
          equals(emergencyPriority));
    });
  });
}
