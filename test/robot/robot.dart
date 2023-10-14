import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';

import 'main_screen_robot.dart';
import 'modal_bottom_sheet_robot.dart';
import 'todo_pane_robot.dart';

class Robot {
  Robot(this.tester) {
    modalBottomSheet = ModalBottomSheetRobot(tester);
    todoPane = TodoPaneRobot(tester);
    mainScreen = MainScreenRobot(tester);
  }

  late final WidgetTester tester;
  late final ModalBottomSheetRobot modalBottomSheet;
  late final TodoPaneRobot todoPane;
  late final MainScreenRobot mainScreen;

  Future<void> pumpMyApp() async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );
    await tester.pumpAndSettle();
  }
}
