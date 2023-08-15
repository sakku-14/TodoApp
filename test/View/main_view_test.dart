import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/main_view.dart';
import 'package:todo_app/View/sort_combo_box_view.dart';
import 'package:todo_app/View/todo_view.dart';

main() {
  /// 各WidgetのKey
  final sortComboBoxInput = find.byKey(sortComboBoxKey);
  final todoInput = find.byKey(todoKey);

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

  group('Todo', () {
    testWidgets('単体のTodoが表示されていること', (tester) async {
      await tester.pumpWidget(mainView(const MainView()));

      expect(todoInput, findsOneWidget); // TodoViewが1つ存在すること

      //expect(find.text(todoTitle), findsOneWidget); // タイトルが正しく表示されていること
      // expect(find.text(emergencyPoint.toString()),
      //     findsOneWidget); // タイトルが正しく表示されていること
      // expect(find.text(priorityPoint.toString()),
      //     findsOneWidget); // タイトルが正しく表示されていること
    });
  });

  group('Todo追加ボタン', () {
    testWidgets('Todo追加ボタンを押下すると、SnackBarが表示されること', (tester) async {
      // given
      await tester.pumpWidget(mainView(const MainView()));
      var floatingActionButton =
          find.widgetWithIcon(FloatingActionButton, Icons.add);
      var snackBar = find.widgetWithText(SnackBar, 'Todo追加ボタンが押下されました');

      // デフォルト表示として、Todo追加ボタンが存在していること
      expect(floatingActionButton, findsOneWidget);

      // when
      await tester.tap(floatingActionButton); // Todo追加ボタンを押下する
      await tester.pumpAndSettle();

      // then
      expect(snackBar, findsOneWidget); // SnackBarが表示されること
    });
  });
}
