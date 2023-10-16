import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/entities/todo_status/todo_status.dart';

import '../test/robot/robot.dart';

const String dbFileName = 'todo_database.db';
const String dbFilePath = 'integration_test/resources/$dbFileName';

void main() {
  final _ = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<File> getDbFile(String fileName) async {
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
      final file = await getDbFile(dbFileName);
      if (file.existsSync()) {
        file.deleteSync(); // ファイルを削除
        debugPrint('ファイルを削除しました: todo_database.db');
      }
    } catch (e) {
      debugPrint('ファイルの削除中にエラーが発生しました: $e');
    }
  }

  Future<void> deployFile() async {
    // 環境変数からプロジェクトのルートディレクトリを取得
    const projectRootDirPath = String.fromEnvironment('projectRoot');

    // テスト用DB ファイルの絶対パスを取得
    final sourceFile = File(join(projectRootDirPath, dbFilePath));
    if (!sourceFile.existsSync()) {
      debugPrint('コピー元のファイルが存在しません: $sourceFile');
      return;
    }

    File destFile = await getDbFile(dbFileName);
    print('コピー元ファイルパス:${sourceFile.path}');
    print('コピー先ファイルパス:${destFile.path}');
    try {
      sourceFile.copySync(destFile.path);
    } catch (e) {
      debugPrint('ファイルのコピー中にエラーが発生しました: $e');
    }
  }

  testWidgets('DBが空の状態でスタート', (WidgetTester tester) async {
    // DBが存在すれば削除
    await deleteFile();
    addTearDown(() {
      deleteFile();
    });

    final r = Robot(tester);
    await r.pumpMyApp();

    // 【消して良いやつ】<<<<<<<<< ここから <<<<<<<<<
    // for (var i = 0; i < 12; i++) { // Todoをスクロールできるように１２個作る
    // 試しに１個Todoを追加する操作
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('title');
    await r.modalBottomSheet.changeEmergencyPoint(3);
    await r.modalBottomSheet.changePriorityPoint(3);
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.complete.statusName);
    await r.modalBottomSheet.pressRegisterButton();
    // } // Todoをスクロールできるように１２個作る

    await r.todoPane.scrollToBottom();
    await r.todoPane.scrollToTop();

    await r.mainScreen.changeComboBoxItem();
    // 【消して良いやつ】>>>>>>>>>> ここまで >>>>>>>>>>

    // await todoRobot.slideTodo();
  });

  // TODO:23.10.17:Y.Sakuma:DBある状態だと、読み書きができないため、後ほど修正する
  // testWidgets('DBにデータがある状態でスタート', (WidgetTester tester) async {
  //   // テスト用DBの配置
  //   await deleteFile();
  //   await deployFile();
  //   addTearDown(() {
  //     deleteFile();
  //   });
  //
  //   final r = Robot(tester);
  //   await r.pumpMyApp();
  //   await tester.pumpAndSettle(Duration(seconds: 2));
  //
  //   // 【消して良いやつ】<<<<<<<<< ここから <<<<<<<<<
  //   // for (var i = 0; i < 12; i++) { // Todoをスクロールできるように１２個作る
  //   // 試しに１個Todoを追加する操作
  //   await r.mainScreen.pressAddButton();
  //   await r.modalBottomSheet.enterTodoTitle('title');
  //   await r.modalBottomSheet.pressRegisterButton();
  //   // } // Todoをスクロールできるように１２個作る
  //
  //   await r.todoPane.scrollToBottom();
  //   await r.todoPane.scrollToTop();
  //
  //   await r.mainScreen.changeComboBoxItem();
  //   // 【消して良いやつ】>>>>>>>>>> ここまで >>>>>>>>>>
  //
  //   // await todoRobot.slideTodo();
  // });
}
