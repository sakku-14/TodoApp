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

    // region 追加
    // region 全てのタブからTodoを追加できること
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_notBegin');
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(1);

    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_progress');
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.progress);
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(1);

    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_stay');
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.stay);
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(1);

    await r.todoPane.changeStatusTabTo(TodoStatus.complete);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_complete');
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.complete);
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(1);
    // endregion
    // endregion

    // region 変更
    // region 全てのタブからTodoを編集できること
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_notBegin_update');
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectTodoSetting(title: '1_1_notBegin_update');

    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changeEmergencyPoint(2);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectTodoSetting(emergencyPoint: 2);

    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changePriorityPoint(2);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectTodoSetting(priorityPoint: 2);

    await r.todoPane.changeStatusTabTo(TodoStatus.complete);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changePriorityPoint(3);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectTodoSetting(priorityPoint: 3);
    // endregion

    // region Todo編集アイコンからステータスを変更した場合、対応したタブに移動すること
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.progress);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectFindNTodo(0);
    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    r.todoPane.expectFindNTodo(2);
    // endregion

    // DDからステータスを変更した場合、対応したタブに移動すること
    // Todo編集アイコンからTodoのタイトルや緊急度、重要度、ステータスを変更した後、キャンセルを押下するとTodoが元のまま更新されていないこと
    // Todoの登録ボトムシートでタイトルを入力していない状態で登録ボタンを押下できないこと
    // Todoの更新ボトムシートでタイトルをクリアした状態で更新ボタンを押下できないこと
    // Todoの更新ボトムシート表示時、既存のTodoの内容を表示していること
    // endregion

    // region 削除
    // Todo削除アイコン押下後、確認ダイアログでOKを押下した場合、削除されること
    // Todo削除アイコン押下後、確認ダイアログでCancelを押下した場合、削除されないこと
    // endregion

    // region 表示
    // 登録日時でソートできること
    // 緊急度×重要度でソートできること
    // 緊急度×重要度の結果が等しい場合、緊急度が優先されてソートできること
    // 緊急度×重要度の結果、及び各ポイントも等しい場合、登録日時が優先されてソートできること
    // 各タブに表示されているTodoの数をタブに表示できること
    // endregion
  });

  // TODO:23.10.17:Y.Sakuma:DB差し替えると、DBの読み書きができないため、後ほど修正する
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
