import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/view/view.dart';

class ModalBottomSheetRobot {
  const ModalBottomSheetRobot(this.tester);

  final WidgetTester tester;

  Future<void> enterTodoTitle(String title) async {
    final titleInput = find.byKey(titleKey);
    expect(titleInput, findsOneWidget);

    await tester.enterText(titleInput, title);
    await tester.pumpAndSettle();
  }

  Future<void> changeEmergencyPoint() async {}
  Future<void> changePriorityPoint() async {}
  Future<void> changeStatusPoint() async {}

  Future<void> pressRegisterButton() async {
    final addBottomSheetViewInput = find.byKey(addBottomSheetKey);
    // Todo追加のボトムシートが表示されていること
    expect(addBottomSheetViewInput, findsOneWidget);

    final addButtonInput = find.byKey(addButtonKey);
    expect(addButtonInput, findsOneWidget);

    await tester.tap(addButtonInput);
    await tester.pumpAndSettle();
  }

  Future<void> pressEditButton() async {}
  Future<void> pressCancelButton() async {}
}
