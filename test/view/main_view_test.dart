import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/view/view.dart';

class _MockTodoList extends TodoList {
  @override
  TodoListState build() {
    return TodoListState(
      todoList: [
        Todo(
          createAt: DateTime.now(),
          title: 'NotBeginTodoTitle',
          emergencyPoint: 1,
          priorityPoint: 1,
          status: TodoStatus.notBegin,
        ),
        Todo(
          createAt: DateTime.now(),
          title: 'ProgressTodoTitle',
          emergencyPoint: 1,
          priorityPoint: 1,
          status: TodoStatus.progress,
        ),
        Todo(
          createAt: DateTime.now(),
          title: 'StayTodoTitle',
          emergencyPoint: 1,
          priorityPoint: 1,
          status: TodoStatus.stay,
        ),
        Todo(
          createAt: DateTime.now(),
          title: 'CompleteTodoTitle',
          emergencyPoint: 1,
          priorityPoint: 1,
          status: TodoStatus.complete,
        ),
      ],
    );
  }

  @override
  Future<bool> updateTodo(Todo newTodo) async {
    state = AsyncValue.data(state.value!.update(newTodo));
    return true;
  }
}

void main() {
  /// 各WidgetのKey
  final sortComboBoxInput = find.byKey(sortComboBoxKey);
  final addBottomSheetInput = find.byKey(addBottomSheetKey);

  ProviderScope mainView(Widget widget) {
    return ProviderScope(
      overrides: [
        todoListProvider.overrideWith(() => _MockTodoList()),
      ],
      child: MaterialApp(
        home: widget,
      ),
    );
  }

  /// 指定されたWidgetをタップして描画を待つ
  Future<void> tapWidget(WidgetTester tester, Finder tapTarget) async {
    await tester.tap(tapTarget);
    await tester.pumpAndSettle();
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
      await tapWidget(tester, find.text(editDate));

      // 「緊急度×重要度」をtapして描画(閉じるまで)を待つ
      await tapWidget(tester, find.text(emergencyPriority).last);

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

    testWidgets('タブを切り替えられること', (tester) async {
      // given
      var notBeginTab = find.widgetWithText(Tab, '未着手');
      var progressTab = find.widgetWithText(Tab, '作業中');
      var stayTab = find.widgetWithText(Tab, '保留');
      var completeTab = find.widgetWithText(Tab, '完了');

      var notBeginTodo = find.text('NotBeginTodoTitle');
      var progressTodo = find.text('ProgressTodoTitle');
      var stayTodo = find.text('StayTodoTitle');
      var completeTodo = find.text('CompleteTodoTitle');

      // when
      await tester.pumpWidget(mainView(const MainView()));

      // then
      await tapWidget(tester, notBeginTab);
      expect(notBeginTodo, findsOneWidget); // 未着手タブを選択した時、未着手のTodoが存在すること

      await tapWidget(tester, progressTab);
      expect(progressTodo, findsOneWidget); // 作業中タブを選択した時、未着手のTodoが存在すること

      await tapWidget(tester, stayTab);
      expect(stayTodo, findsOneWidget); // 保留タブを選択した時、未着手のTodoが存在すること

      await tapWidget(tester, completeTab);
      expect(completeTodo, findsOneWidget); // 完了タブを選択した時、未着手のTodoが存在すること
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
      await tapWidget(tester, floatingActionButton); // Todo追加ボタンを押下する

      // then
      expect(addBottomSheetInput, findsOneWidget); // ボトムシートが表示されていること
      expect(find.text('Todoの登録'), findsOneWidget); // タイトルが「登録」であること
    });
  });

  group('ドラッグ&ドロップ', () {
    testWidgets('ドラッグ&ドロップでTodoのステータス変更ができること', (tester) async {
      // given
      await tester.pumpWidget(mainView(const MainView()));
      var ddTargetTodo = find.text('NotBeginTodoTitle');

      // DD対象のTodoが未着手タブ内に存在すること
      expect(ddTargetTodo, findsOneWidget);

      // ジェスチャーの開始地点を決定
      final firstLocation = tester.getCenter(find.text('NotBeginTodoTitle'));
      final gesture = await tester.startGesture(firstLocation);

      // ドラッグ可能になるまで待機
      await tester.pump(const Duration(seconds: 1));

      // 対象の箇所まで開始地点から移動
      await gesture.moveTo(tester.getCenter(find.widgetWithText(Tab, '作業中')));
      await tester.pumpAndSettle();

      // ジェスチャーの解除
      await gesture.up();
      await tester.pumpAndSettle();

      expect(ddTargetTodo, findsNothing); // DD対象のTodoが未着手タブ内に存在しないこと

      await tapWidget(tester, find.widgetWithText(Tab, '作業中'));
      await tester.pumpAndSettle();
      expect(ddTargetTodo, findsOneWidget); // DD対象のTodoが作業中タブ内に存在すること
    });
  });
}
