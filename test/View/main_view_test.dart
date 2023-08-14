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

  testWidgets('アップバーにタイトルが表示されていること', (tester) async {
    // given
    await tester.pumpWidget(mainView(const MainView()));
    final appBarTextFinder = find.text('Todoアプリ');

    // when
    // then
    expect(appBarTextFinder, findsOneWidget);
  });

  testWidgets('ソート用ComboBoxが表示されていること', (tester) async {
    // given
    await tester.pumpWidget(mainView(const MainView()));

    // when
    // then
    expect(find.byKey(const Key('dropdown')), findsOneWidget);
  });

  testWidgets('ソート用ComboBoxの値が切り替わること', (tester) async {
    await tester.pumpWidget(mainView(const MainView()));

    // ドロップダウンが開く前に、「登録日時」を持つWidgetが1つあること
    expect(
        (tester.widget(find.byKey(const Key('dropdown'))) as DropdownButton)
            .value,
        equals('登録日時'));

    // ドロップダウンをtapで開く
    await tester.tap(find.text('登録日時'));

    // pumpを2回呼び出す → 理由は不明
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // 「緊急度×重要度」をtap
    await tester.tap(find.text('緊急度×重要度').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // 「緊急度×重要度」を持つWidgetが1つあること
    expect(
        (tester.widget(find.byKey(const Key('dropdown'))) as DropdownButton)
            .value,
        equals('緊急度×重要度'));
  });
}
