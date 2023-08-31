// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  var binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // var tabOfNotBegin = find.widgetWithText(Tab, '未着手');
  // var tabOfProgress = find.widgetWithText(Tab, '作業中');
  // var tabOfStay = find.widgetWithText(Tab, '保留');
  // var tabOfComplete = find.widgetWithText(Tab, '完了');
  var notBeginTodoElementTitle = find.text('notBegin');
  // var progressTodoElementTitle = find.text('progress');
  // var stayTodoElementTitle = find.text('stay');
  // var completeTodoElementTitle = find.text('complete');

  testWidgets('シナリオ１', (widgetTester) async {
    // await widgetTester.pumpWidget(const ProviderScope(child: MyApp()));
    //
    // // タブをタップしてリスト表示が切り替わること
    // await widgetTester.tap(tabOfProgress);
    // await widgetTester.pumpAndSettle();
    // expect(progressTodoElementTitle, findsAtLeastNWidgets(1));
    //
    // await widgetTester.tap(tabOfStay);
    // await widgetTester.pumpAndSettle();
    // expect(stayTodoElementTitle, findsAtLeastNWidgets(1));
    //
    // await widgetTester.tap(tabOfComplete);
    // await widgetTester.pumpAndSettle();
    // expect(completeTodoElementTitle, findsAtLeastNWidgets(1));
    //
    // await widgetTester.tap(tabOfNotBegin);
    // await widgetTester.pumpAndSettle();
    // expect(notBeginTodoElementTitle, findsAtLeastNWidgets(1));

    // スクロールしてみる
    // var firstTodo = notBeginTodoElementTitle.first;
    var lastTodo = notBeginTodoElementTitle.last;
    // var scrollArea = find.byType(Scrollable).last;

    // expect(firstTodo.hitTestable(), findsOneWidget);
    // expect(lastTodo.hitTestable(), findsNothing);
    // expect(scrollArea, findsOneWidget);

    await binding.traceAction(
      () async {
        await widgetTester.scrollUntilVisible(
          lastTodo,
          500.0,
          // scrollable: scrollArea,
        );
      },
      reportKey: 'scrolling_timeline',
    );
    // await widgetTester.pumpAndSettle();

    // expect(firstTodo.hitTestable(), findsNothing);
    // expect(lastTodo.hitTestable(), findsOneWidget);
  });
}
