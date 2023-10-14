import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MainScreenRobot {
  const MainScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> pressAddButton() async {
    final floatingActionButton =
        find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(floatingActionButton, findsOneWidget);
    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle();
  }

  Future<void> changeComboBoxItem() async {}
}
