import 'package:flutter_test/flutter_test.dart';

class ModalBottomSheetRobot {
  const ModalBottomSheetRobot(this.tester);

  final WidgetTester tester;

  Future<void> pumpMyApp() async {}
  Future<void> enterTodoTitle() async {}
  Future<void> changeEmergencyPoint() async {}
  Future<void> changePriorityPoint() async {}
  Future<void> changeStatusPoint() async {}
  Future<void> pressAddButton() async {}
  Future<void> pressEditButton() async {}
  Future<void> pressCancelButton() async {}
}
