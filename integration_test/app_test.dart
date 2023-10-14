import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../test/robot/robot.dart';

void main() {
  final _ = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<String> crateFilePath(String fileName) async {
    var dbFilePath = '';

    if (Platform.isAndroid) {
      dbFilePath = await getDatabasesPath();
    } else if (Platform.isIOS) {
      final dbDirectory = await getLibraryDirectory();
      dbFilePath = dbDirectory.path;
    }
    return join(dbFilePath, fileName);
  }

  // Future<void> renameFile(String currentFileName, String newFileName) async {
  //   var dbFilePath = await crateFilePath(currentFileName);
  //   debugPrint('sqLiteFilePath:$dbFilePath');
  //
  //   try {
  //     final file = File(dbFilePath);
  //     if (file.existsSync()) {
  //       final newPath = file.parent.path + Platform.pathSeparator + newFileName;
  //       file.renameSync(newPath); // ファイル名を変更
  //     } else {
  //       debugPrint('指定されたファイルが存在しません: $currentFileName');
  //     }
  //   } catch (e) {
  //     debugPrint('ファイル名の変更中にエラーが発生しました: $e');
  //   }
  // }

  Future<void> deleteFile() async {
    var dbFilePath = await crateFilePath('todo_database_test.db');
    try {
      final file = File(dbFilePath);
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
    // // プロジェクトのルートディレクトリを取得
    // // final currentDirectory = Directory.current.path;
    // var path1 = path.join(directory, relativePath);
    const relativePath = String.fromEnvironment('projectRoot');
    debugPrint(relativePath);

    // テスト用DB ファイルの絶対パスを取得
    final dbFilePath = File(path.join(
        relativePath, 'integration_test/resources/todo_database_test.db'));
    if (!dbFilePath.existsSync()) {
      debugPrint('コピー元のファイルが存在しません: $dbFilePath');
      return;
    }

    File desFilePath = File(await crateFilePath('todo_database_test.db'));
    debugPrint('testDbFilePath:$desFilePath');
    try {
      // final content = dbFilePath.readAsStringSync();
      desFilePath.copySync(desFilePath.path);
    } catch (e) {
      debugPrint('ファイルのコピー中にエラーが発生しました: $e');
    }
  }

  testWidgets('DBが空の状態でスタート', (WidgetTester tester) async {
    // DBのSetUpをやるよ
    final r = Robot(tester);
    await r.pumpMyApp();

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
