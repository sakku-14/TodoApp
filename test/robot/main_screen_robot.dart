import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/view/sort_combo_box_view.dart';

class MainScreenRobot {
  const MainScreenRobot(this.tester);

  final WidgetTester tester;

  /// 指定されたWidgetをタップして描画を待つ
  Future<void> _tapWidget(WidgetTester tester, Finder tapTarget) async {
    await tester.tap(tapTarget);
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
  }

  Future<void> pressAddButton() async {
    final floatingActionButton =
        find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(floatingActionButton, findsOneWidget);
    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle();
  }

  Future<void> changeComboBoxItem() async {
    const String editDate = '登録日時';
    const String emergencyPriority = '緊急度×重要度';

    // 「登録日時」を持つWidgetが1つあること
    final sortComboBoxInput = find.byKey(sortComboBoxKey);
    expect((tester.widget(sortComboBoxInput) as DropdownButton).value,
        equals(editDate));

    // ドロップダウンをtapして描画(開くまで)を待つ
    await _tapWidget(tester, find.text(editDate));

    // 「緊急度×重要度」をtapして描画(閉じるまで)を待つ
    await _tapWidget(tester, find.text(emergencyPriority).last);

    // 「緊急度×重要度」を持つWidgetが1つあること
    expect((tester.widget(sortComboBoxInput) as DropdownButton).value,
        equals(emergencyPriority));
  }
}
