import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/View/sort_combo_box_view.dart';

main() {
  List<String> sortComboBoxValues = ['登録日時', '緊急度×重要度'];

  MaterialApp sortComboBoxView(Widget widget) {
    return MaterialApp(
      home: Material(child: widget),
    );
  }

  testWidgets('ソート用ComboBoxを選択できること', (tester) async {
    // given
    await tester.pumpWidget(sortComboBoxView(SortComboBoxView(
        dropDownValues: sortComboBoxValues,
        isSelectedValue: '登録日時',
        updateSelectedValue: (String value) {})));
    final dropdown = find.byKey(const ValueKey('dropdown'));

    await tester.tap(dropdown);
    await tester.pumpAndSettle();

    final dropdownItem = find.text('登録日時').last;

    await tester.tap(dropdownItem);
    await tester.pumpAndSettle();
  });
}
