import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart' as app;

import '../test/robot/modal_bottom_sheet_robot.dart';
import '../test/robot/todo_robot.dart';

void main() {
  var binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('authenticate a user', (WidgetTester tester) async {
    final todoRobot = TodoRobot(tester);
    final modalBottomSheetRobot = ModalBottomSheetRobot(tester);
    app.main();
    await tester.pumpAndSettle();

    // await todoRobot.slideTodo();
  });
}
