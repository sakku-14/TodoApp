import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart' as app;

void main() {
  var binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('DBが空の状態でスタート', (WidgetTester tester) async {
    // DBのSetUpをやるよ
    app.main();
    await tester.pumpAndSettle();

    // await todoRobot.slideTodo();

    addTearDown(() {
      // このテストケースの直後のみで実行される
      print("   Only this Test Case");
    });
  });

  testWidgets('DBにデータがある状態でスタート', (WidgetTester tester) async {
    // DBのSetUpをやるよ
    app.main();
    await tester.pumpAndSettle();

    // await todoRobot.slideTodo();

    addTearDown(() {
      // このテストケースの直後のみで実行される
      print("   Only this Test Case");
    });
  });
}
