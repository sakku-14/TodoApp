import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/sort_combo_box_view.dart';

main() {
  /// 各WidgetのKey
  final sortComboBoxInput = find.byKey(sortComboBoxKey);

  List<String> sortComboBoxValues = ['登録日時', '緊急度×重要度'];

  MaterialApp sortComboBoxView(Widget widget) {
    return MaterialApp(
      home: Material(child: widget),
    );
  }

  testWidgets('ソート用ComboBoxを選択できること', (tester) async {
    const String editDate = '登録日時';

    await tester.pumpWidget(sortComboBoxView(SortComboBoxView(
        dropDownValues: sortComboBoxValues,
        isSelectedValue: editDate,
        updateSelectedValue: (String value) {})));

    await tester.tap(sortComboBoxInput);
    await tester.pumpAndSettle();

    final dropdownItem = find.text(editDate).last;

    await tester.tap(dropdownItem);
    await tester.pumpAndSettle();
  });
}
