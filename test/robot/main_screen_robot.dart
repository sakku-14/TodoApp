import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/view/sort_combo_box_view.dart';

class MainScreenRobot {
  const MainScreenRobot(this.tester);

  final WidgetTester tester;

  /// 指定されたWidgetをタップして描画を待つ
  Future<void> _tapWidget(Finder tapTarget) async {
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

  Future<void> changeComboBoxItemTo(SortState sortState) async {
    final comboBox = find.byKey(sortComboBoxKey);
    expect(comboBox, findsOneWidget);

    await _tapWidget(comboBox);

    final destComboBoxItem = find.text(sortState.typeName);
    expect(destComboBoxItem, findsOneWidget);

    await _tapWidget(destComboBoxItem);

    final comboBoxItemName =
        tester.widget<DropdownButton>(comboBox).value as String;
    expect(comboBoxItemName, equals(sortState.typeName));
  }
}
