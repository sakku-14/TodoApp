import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/model.dart';

import '../test/robot/robot.dart';
import '../test/robot/todo_pane_robot.dart';

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
    r.todoPane
        .expectTodoDisplayFromTop([TodoDisplayData('1_1_notBegin', 1, 1)]);

    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_progress');
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.progress);
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(1);
    r.todoPane
        .expectTodoDisplayFromTop([TodoDisplayData('1_1_progress', 1, 1)]);

    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_stay');
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.stay);
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(1);
    r.todoPane.expectTodoDisplayFromTop([TodoDisplayData('1_1_stay', 1, 1)]);

    await r.todoPane.changeStatusTabTo(TodoStatus.complete);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_complete');
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.complete);
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(1);
    r.todoPane
        .expectTodoDisplayFromTop([TodoDisplayData('1_1_complete', 1, 1)]);
    // endregion
    // endregion

    // region 変更
    // region 全てのタブからTodoを編集できること
    const newTitle = '1_1_notBegin_update';
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.enterTodoTitle(newTitle);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectNIndexTodoDisplay(title: newTitle);

    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changeEmergencyPoint(2);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectNIndexTodoDisplay(emergencyPoint: 2);

    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changePriorityPoint(2);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectNIndexTodoDisplay(priorityPoint: 2);

    await r.todoPane.changeStatusTabTo(TodoStatus.complete);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changePriorityPoint(3);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectNIndexTodoDisplay(priorityPoint: 3);
    // endregion

    // region Todoの更新ボトムシート表示時、既存のTodoの内容を表示していること
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    r.modalBottomSheet.expectSheetContents(newTitle, 1, 1, TodoStatus.notBegin);
    await r.modalBottomSheet.pressUpdateCancelButton();
    // endregion

    // region Todo編集アイコンからTodoのタイトルや緊急度、重要度、ステータスを変更した後、キャンセルを押下するとTodoが元のまま更新されていないこと
    r.todoPane.expectFindNTodo(1);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.progress);
    await r.modalBottomSheet.pressUpdateCancelButton();
    r.todoPane.expectFindNTodo(1);
    // endregion

    // region Todo編集アイコンからステータスを変更した場合、対応したタブに移動すること
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.progress);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectFindNTodo(0);
    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    r.todoPane.expectFindNTodo(2);
    // endregion

    // region DDからステータスを変更した場合、対応したタブに移動すること
    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    await r.todoPane.dragFromTo(destStatus: TodoStatus.progress);
    r.todoPane.expectFindNTodo(0);
    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    r.todoPane.expectFindNTodo(3);
    // endregion

    // region Todoの登録ボトムシートでタイトルを入力していない状態で登録ボタンを押下できないこと
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.pressRegisterButton();
    r.modalBottomSheet.expectStillOpenBottomSheet();
    await r.modalBottomSheet.pressRegisterCancelButton();
    // endregion

    // region Todoの更新ボトムシートでタイトルをクリアした状態で更新ボタンを押下できないこと
    await r.todoPane.changeStatusTabTo(TodoStatus.complete);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.enterTodoTitle('');
    await r.modalBottomSheet.pressUpdateButton();
    r.modalBottomSheet.expectStillOpenBottomSheet();
    await r.modalBottomSheet.pressUpdateCancelButton();
    // endregion
    // endregion

    // region 削除
    // region Todo削除アイコン押下後、確認ダイアログでCancelを押下した場合、削除されないこと
    await r.todoPane.slideTodo();
    await r.todoPane.pressDeleteButton();
    await r.todoPane.pressDeleteCancelButton();
    r.todoPane.expectFindNTodo(1);
    // endregion

    // region Todo削除アイコン押下後、確認ダイアログでOKを押下した場合、削除されること
    await r.todoPane.slideTodo();
    await r.todoPane.pressDeleteButton();
    await r.todoPane.pressDeleteOkButton();
    r.todoPane.expectFindNTodo(0);
    // endregion
    // endregion

    // region 表示
    // region 登録日時でソートできること
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);

    // 以下の順にTodoを追加する
    // (タイトル、緊急度、重要度) = (1_1_2、１、２)
    // (タイトル、緊急度、重要度) = (2_2_1、２、１)
    // (タイトル、緊急度、重要度) = (3_1_3、１、３)
    // (タイトル、緊急度、重要度) = (4_1_3、１、３)
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_2');
    await r.modalBottomSheet.changePriorityPoint(2);
    await r.modalBottomSheet.pressRegisterButton();
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('2_2_1');
    await r.modalBottomSheet.changeEmergencyPoint(2);
    await r.modalBottomSheet.pressRegisterButton();
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('3_1_3');
    await r.modalBottomSheet.changePriorityPoint(3);
    await r.modalBottomSheet.pressRegisterButton();
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('4_1_3');
    await r.modalBottomSheet.changePriorityPoint(3);
    await r.modalBottomSheet.pressRegisterButton();

    r.todoPane.expectIsExpectedOrder(['1_1_2', '2_2_1', '3_1_3', '4_1_3']);
    // endregion

    // region 緊急度×重要度でソートできること
    await r.mainScreen.changeComboBoxItemTo(SortState.emergencyTimesPrimary);
    r.todoPane.expectIsExpectedOrder(['3_1_3', '4_1_3', '2_2_1', '1_1_2']);
    // endregion

    // region 各タブに表示されているTodoの数をタブに表示できること
    r.todoPane.expectTodoTabNCount(TodoStatus.notBegin, 4);
    r.todoPane.expectTodoTabNCount(TodoStatus.progress, 3);
    r.todoPane.expectTodoTabNCount(TodoStatus.stay, 0);
    r.todoPane.expectTodoTabNCount(TodoStatus.complete, 0);
    // endregion
    // endregion
  });

  testWidgets('DBにデータがある状態でスタート', (WidgetTester tester) async {
    // テスト用DBの配置
    await deleteFile();
    await deployFile();
    addTearDown(() {
      deleteFile();
    });

    final r = Robot(tester);
    await r.pumpMyApp();

    // region 初期表示
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);
    r.todoPane.expectFindNTodo(2);
    r.todoPane.expectTodoDisplayFromTop([
      TodoDisplayData('未着手1', 1, 1),
      TodoDisplayData('未着手2', 2, 2),
    ]);
    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    r.todoPane.expectFindNTodo(2);
    r.todoPane.expectTodoDisplayFromTop([
      TodoDisplayData('作業中1', 1, 1),
      TodoDisplayData('作業中2', 2, 2),
    ]);
    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    r.todoPane.expectFindNTodo(2);
    r.todoPane.expectTodoDisplayFromTop([
      TodoDisplayData('保留1', 1, 1),
      TodoDisplayData('保留2', 2, 2),
    ]);
    await r.todoPane.changeStatusTabTo(TodoStatus.complete);
    r.todoPane.expectFindNTodo(2);
    r.todoPane.expectTodoDisplayFromTop([
      TodoDisplayData('完了1', 1, 1),
      TodoDisplayData('完了2', 2, 2),
    ]);

    // endregion

    // region 追加
    // region 全てのタブからTodoを追加できること
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_notBegin');
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(3);
    r.todoPane.expectTodoDisplayFromTop([
      TodoDisplayData('未着手1', 1, 1),
      TodoDisplayData('未着手2', 2, 2),
      TodoDisplayData('1_1_notBegin', 1, 1)
    ]);

    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_progress');
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.progress);
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(3);
    r.todoPane.expectTodoDisplayFromTop([
      TodoDisplayData('作業中1', 1, 1),
      TodoDisplayData('作業中2', 2, 2),
      TodoDisplayData('1_1_progress', 1, 1)
    ]);

    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_stay');
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.stay);
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(3);
    r.todoPane.expectTodoDisplayFromTop([
      TodoDisplayData('保留1', 1, 1),
      TodoDisplayData('保留2', 2, 2),
      TodoDisplayData('1_1_stay', 1, 1)
    ]);

    await r.todoPane.changeStatusTabTo(TodoStatus.complete);
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_complete');
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.complete);
    await r.modalBottomSheet.pressRegisterButton();
    r.todoPane.expectFindNTodo(3);
    r.todoPane.expectTodoDisplayFromTop([
      TodoDisplayData('完了1', 1, 1),
      TodoDisplayData('完了2', 2, 2),
      TodoDisplayData('1_1_complete', 1, 1)
    ]);
    // endregion
    // endregion

    // region 変更
    // region 全てのタブからTodoを編集できること
    const newTitle = '1_1_notBegin_update';
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);
    await r.todoPane.slideTodo(index: 2);
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.enterTodoTitle(newTitle);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectNIndexTodoDisplay(index: 2, title: newTitle);

    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    await r.todoPane.slideTodo(index: 2);
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changeEmergencyPoint(2);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectNIndexTodoDisplay(index: 2, emergencyPoint: 2);

    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    await r.todoPane.slideTodo(index: 2);
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changePriorityPoint(2);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectNIndexTodoDisplay(index: 2, priorityPoint: 2);

    await r.todoPane.changeStatusTabTo(TodoStatus.complete);
    await r.todoPane.slideTodo(index: 2);
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changePriorityPoint(3);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectNIndexTodoDisplay(index: 2, priorityPoint: 3);
    // endregion

    // region Todoの更新ボトムシート表示時、既存のTodoの内容を表示していること
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);
    await r.todoPane.slideTodo(index: 2);
    await r.todoPane.pressUpdateButton();
    r.modalBottomSheet.expectSheetContents(newTitle, 1, 1, TodoStatus.notBegin);
    await r.modalBottomSheet.pressUpdateCancelButton();
    // endregion

    // region Todo編集アイコンからTodoのタイトルや緊急度、重要度、ステータスを変更した後、キャンセルを押下するとTodoが元のまま更新されていないこと
    r.todoPane.expectFindNTodo(3);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.progress);
    await r.modalBottomSheet.pressUpdateCancelButton();
    r.todoPane.expectFindNTodo(3);
    // endregion

    // region Todo編集アイコンからステータスを変更した場合、対応したタブに移動すること
    await r.todoPane.slideTodo(index: 2);
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.changeStatusPoint(TodoStatus.progress);
    await r.modalBottomSheet.pressUpdateButton();
    r.todoPane.expectFindNTodo(2);
    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    r.todoPane.expectFindNTodo(4);
    // endregion

    // region DDからステータスを変更した場合、対応したタブに移動すること
    await r.todoPane.changeStatusTabTo(TodoStatus.stay);
    await r.todoPane.dragFromTo(destStatus: TodoStatus.progress, todoIndex: 2);
    r.todoPane.expectFindNTodo(2);
    await r.todoPane.changeStatusTabTo(TodoStatus.progress);
    r.todoPane.expectFindNTodo(5);
    // endregion

    // region Todoの登録ボトムシートでタイトルを入力していない状態で登録ボタンを押下できないこと
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.pressRegisterButton();
    r.modalBottomSheet.expectStillOpenBottomSheet();
    await r.modalBottomSheet.pressRegisterCancelButton();
    // endregion

    // region Todoの更新ボトムシートでタイトルをクリアした状態で更新ボタンを押下できないこと
    await r.todoPane.changeStatusTabTo(TodoStatus.complete);
    await r.todoPane.slideTodo();
    await r.todoPane.pressUpdateButton();
    await r.modalBottomSheet.enterTodoTitle('');
    await r.modalBottomSheet.pressUpdateButton();
    r.modalBottomSheet.expectStillOpenBottomSheet();
    await r.modalBottomSheet.pressUpdateCancelButton();
    // endregion
    // endregion

    // region 削除
    // region Todo削除アイコン押下後、確認ダイアログでCancelを押下した場合、削除されないこと
    await r.todoPane.slideTodo();
    await r.todoPane.pressDeleteButton();
    await r.todoPane.pressDeleteCancelButton();
    r.todoPane.expectFindNTodo(3);
    // endregion

    // region Todo削除アイコン押下後、確認ダイアログでOKを押下した場合、削除されること
    await r.todoPane.slideTodo(index: 2);
    await r.todoPane.pressDeleteButton();
    await r.todoPane.pressDeleteOkButton();
    r.todoPane.expectFindNTodo(2);
    // endregion
    // endregion

    // region 表示
    // region 登録日時でソートできること
    await r.todoPane.changeStatusTabTo(TodoStatus.notBegin);

    // 以下の順にTodoを追加する
    // (タイトル、緊急度、重要度) = (1_1_2、１、２)
    // (タイトル、緊急度、重要度) = (2_2_1、２、１)
    // (タイトル、緊急度、重要度) = (3_1_3、１、３)
    // (タイトル、緊急度、重要度) = (4_1_3、１、３)
    // 以下既存
    // (タイトル、緊急度、重要度) = (未着手1、１、１)
    // (タイトル、緊急度、重要度) = (未着手2、２、２)
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('1_1_2');
    await r.modalBottomSheet.changePriorityPoint(2);
    await r.modalBottomSheet.pressRegisterButton();
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('2_2_1');
    await r.modalBottomSheet.changeEmergencyPoint(2);
    await r.modalBottomSheet.pressRegisterButton();
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('3_1_3');
    await r.modalBottomSheet.changePriorityPoint(3);
    await r.modalBottomSheet.pressRegisterButton();
    await r.mainScreen.pressAddButton();
    await r.modalBottomSheet.enterTodoTitle('4_1_3');
    await r.modalBottomSheet.changePriorityPoint(3);
    await r.modalBottomSheet.pressRegisterButton();

    r.todoPane.expectIsExpectedOrder(
        ['未着手1', '未着手2', '1_1_2', '2_2_1', '3_1_3', '4_1_3']);
    // endregion

    // region 緊急度×重要度でソートできること
    await r.mainScreen.changeComboBoxItemTo(SortState.emergencyTimesPrimary);
    r.todoPane.expectIsExpectedOrder(
        ['未着手2', '3_1_3', '4_1_3', '2_2_1', '1_1_2', '未着手1']);
    // endregion

    // region 各タブに表示されているTodoの数をタブに表示できること
    r.todoPane.expectTodoTabNCount(TodoStatus.notBegin, 6);
    r.todoPane.expectTodoTabNCount(TodoStatus.progress, 5);
    r.todoPane.expectTodoTabNCount(TodoStatus.stay, 2);
    r.todoPane.expectTodoTabNCount(TodoStatus.complete, 2);
    // endregion
    // endregion
  });
}
