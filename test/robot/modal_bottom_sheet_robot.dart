import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/model/entities/todo_status/todo_status.dart';
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

  Future<void> changeEmergencyPoint(int targetPoint) async {
    // 緊急度の選択肢が存在すること
    expect(find.byKey(emergencyKey), findsOneWidget);

    UniqueKey key = emergency1;
    switch (targetPoint) {
      case 1:
        key = emergency1;
        break;
      case 2:
        key = emergency2;
        break;
      case 3:
        key = emergency3;
        break;
      default:
        debugPrint("EmergencyPoint：1~3を指定してください。");
    }

    // 選択状態を切り替える
    await tester.tap(find.byKey(key));
    await tester.pumpAndSettle();

    final emergencyPointSegmentedControl =
        tester.widget<CupertinoSegmentedControl>(find.byKey(emergencyKey));
    final emergencyPointGroupValue = emergencyPointSegmentedControl.groupValue;
    expect(emergencyPointGroupValue, targetPoint);
  }

  Future<void> changePriorityPoint(int targetPoint) async {
    // 重要度の選択肢が存在すること
    expect(find.byKey(priorityKey), findsOneWidget);

    UniqueKey key = priority1;
    switch (targetPoint) {
      case 1:
        key = priority1;
        break;
      case 2:
        key = priority2;
        break;
      case 3:
        key = priority3;
        break;
      default:
        debugPrint("PriorityPoint：1~3を指定してください。");
    }

    // 選択状態を切り替える
    await tester.tap(find.byKey(key));
    await tester.pumpAndSettle();

    final priorityPointSegmentedControl =
        tester.widget<CupertinoSegmentedControl>(find.byKey(priorityKey));
    final priorityPointGroupValue = priorityPointSegmentedControl.groupValue;
    expect(priorityPointGroupValue, targetPoint);
  }

  Future<void> changeStatusPoint(TodoStatus status) async {
    // ステータスの選択肢が存在すること
    final statusWidget = find.byKey(statusKey);
    expect(statusWidget, findsOneWidget);

    UniqueKey key;
    switch (status) {
      case TodoStatus.notBegin:
        key = statusNotBegin;
      case TodoStatus.progress:
        key = statusProgress;
      case TodoStatus.stay:
        key = statusStay;
      case TodoStatus.complete:
        key = statusComplete;
    }

    // 選択状態を切り替える
    await tester.tap(find.byKey(key));
    await tester.pumpAndSettle();

    final statusNameSegmentedControl =
        tester.widget<CupertinoSegmentedControl>(statusWidget);
    final statusNameGroupValue =
        statusNameSegmentedControl.groupValue as TodoStatus;
    expect(statusNameGroupValue, status);
  }

  Future<void> pressRegisterButton() async {
    // Todo追加のボトムシートが表示されていること
    expect(find.byKey(addBottomSheetKey), findsOneWidget);

    expect(find.byKey(addButtonKey), findsOneWidget);

    await tester.tap(find.byKey(addButtonKey));
    await tester.pumpAndSettle();
  }

  Future<void> pressUpdateButton() async {
    final updateBottomSheetViewInput = find.byKey(updateBottomSheetKey);
    // Todo更新のボトムシートが表示されていること
    expect(updateBottomSheetViewInput, findsOneWidget);

    final updateButtonInput = find.byKey(updateButtonKey);
    expect(updateButtonInput, findsOneWidget);

    await tester.tap(updateButtonInput);
    await tester.pumpAndSettle();
  }

  Future<void> pressRegisterCancelButton() async {
    // 登録用のキャンセルテキストボタンをタップ
    final cancelButtonInput = find.byKey(cancelButtonForAddBottomSheetKey);
    expect(cancelButtonInput, findsOneWidget);
    await tester.tap(cancelButtonInput);
    await tester.pumpAndSettle();
  }

  Future<void> pressUpdateCancelButton() async {
    // 更新用のキャンセルテキストボタンをタップ
    final cancelButtonInput = find.byKey(cancelButtonForUpdateBottomSheetKey);
    expect(cancelButtonInput, findsOneWidget);
    await tester.tap(cancelButtonInput);
    await tester.pumpAndSettle();
  }
}
