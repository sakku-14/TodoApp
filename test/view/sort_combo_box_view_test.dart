import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/view/view.dart';

main() {
  /// 各WidgetのKey
  final sortComboBoxInput = find.byKey(sortComboBoxKey);

  ProviderScope sortComboBoxView(Widget widget) {
    return ProviderScope(
      child: MaterialApp(
        home: Material(child: widget),
      ),
    );
  }

  testWidgets('ソート用ComboBoxを選択し、選択肢を変更できること', (tester) async {
    // given
    final dropdownItem = find.text(SortState.createdAt.typeName).last;
    final anotherDropDownItem =
        find.text(SortState.emergencyTimesPrimary.typeName).last;

    // when
    await tester.pumpWidget(sortComboBoxView(const SortComboBoxView()));

    await tester.tap(sortComboBoxInput);
    await tester.pumpAndSettle();
    expect(dropdownItem.hitTestable(), findsOneWidget);

    await tester.tap(anotherDropDownItem);
    await tester.pumpAndSettle();

    // then
    expect(anotherDropDownItem.hitTestable(), findsOneWidget);
  });
}
