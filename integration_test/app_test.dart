import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/model/entities/todo_status/todo_status.dart';

import '../test/robot/robot.dart';

void main() {
  final _ = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('DBが空の状態でスタート', (WidgetTester tester) async {
    // DBのSetUpをやるよ
    final r = Robot(tester);
    await r.pumpMyApp();

    // 【消して良いやつ】試しに１個Todoを追加する操作
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('title');
    await r.modalBottomSheet.pressAddButton();
    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);

    // await todoRobot.slideTodo();

    addTearDown(() {
      // このテストケースの直後のみで実行される
      print("   Only this Test Case");
    });
  });

  testWidgets('DBにデータがある状態でスタート', (WidgetTester tester) async {
    // DBのSetUpをやるよ
    final r = Robot(tester);
    await r.pumpMyApp();

    // await todoRobot.slideTodo();

    addTearDown(() {
      // このテストケースの直後のみで実行される
      print("   Only this Test Case");
    });
  });
}
