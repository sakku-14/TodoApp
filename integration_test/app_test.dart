import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/entities/todo_status/todo_status.dart';

import '../test/robot/robot.dart';

const String dbFileName = 'todo_database_test.db';
const String dbFilePath = 'integration_test/resources/$dbFileName';

void main() {
  final _ = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<File> crateFilePath(String fileName) async {
    var dbFilePath = '';

    if (Platform.isAndroid) {
      dbFilePath = await getDatabasesPath();
    } else if (Platform.isIOS) {
      final dbDirectory = await getLibraryDirectory();
      dbFilePath = dbDirectory.path;
    }
    return File(join(dbFilePath, fileName));
  }

  Future<void> deleteFile() async {
    try {
      final file = await crateFilePath(dbFileName);
      if (file.existsSync()) {
        file.deleteSync(); // ファイルを削除
        debugPrint('ファイルを削除しました: todo_database_test.db');
      } else {
        debugPrint('指定されたファイルが存在しません: todo_database_test.db');
      }
    } catch (e) {
      debugPrint('ファイルの削除中にエラーが発生しました: $e');
    }
  }

  Future<void> deployFile() async {
    // 環境変数からプロジェクトのルートディレクトリを取得
    const relativePath = String.fromEnvironment('projectRoot');

    // テスト用DB ファイルの絶対パスを取得
    final absoluteFilePath = File(join(relativePath, dbFilePath));
    if (!absoluteFilePath.existsSync()) {
      debugPrint('コピー元のファイルが存在しません: $absoluteFilePath');
      return;
    }

    File destinationFilePath = await crateFilePath(dbFileName);
    try {
      destinationFilePath.copySync(destinationFilePath.path);
    } catch (e) {
      debugPrint('ファイルのコピー中にエラーが発生しました: $e');
    }
  }

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
      debugPrint("   Only this Test Case");
    });
  });

  testWidgets('DBにデータがある状態でスタート', (WidgetTester tester) async {
    // DBのSetUpをやるよ
    final r = Robot(tester);
    await r.pumpMyApp();

    // await todoRobot.slideTodo();

    addTearDown(() {
      // このテストケースの直後のみで実行される
      debugPrint("   Only this Test Case");
    });
  });
}
