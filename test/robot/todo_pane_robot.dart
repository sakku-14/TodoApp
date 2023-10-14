import 'package:flutter_test/flutter_test.dart';

class TodoPaneRobot {
  const TodoPaneRobot(this.tester);

  final WidgetTester tester;

  Future<void> scrollToBottom() async {}
  Future<void> changeStateTab() async {}
  Future<void> slideTodo() async {}
  Future<void> pressUpdateButton() async {}
  Future<void> pressDeleteButton() async {}
  Future<void> dragToNotBegin() async {}
  Future<void> dragToProgress() async {}
  Future<void> dragToComplete() async {}
  Future<void> dragToStay() async {}
}
