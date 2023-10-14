import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/robot/robot.dart';

void main() {
  final _ = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('DBが空の状態でスタート', (WidgetTester tester) async {
    // DBのSetUpをやるよ
    final r = Robot(tester);
    await r.pumpMyApp();

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
