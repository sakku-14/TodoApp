import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/main_view.dart';
import 'package:todo_app/main.dart';

main() {
  MaterialApp mainView(Widget widget) {
    return MaterialApp(
      home: widget,
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
}
