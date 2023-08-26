import 'dart:math' as math;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Infrastructure/event_bus.dart';

import '../../Domain/Event/add_todo_event.dart';
import '../Dto/todo_dto.dart';
import 'main_view_model_state.dart';

part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  @override
  MainViewModelState build() {
    // TODO:23.8.19:A.Uehara:Buildメソッドが複数回呼ばれる可能性があり、多重購読になるから違う購読方法を知りたい
    eventBus.on<AddTodoEvent>().listen((event) => addTodo(event));

    // TODO:23.8.19:A.Uehara:MainView生成時にDebug用Todoを生成せいているが、本来はRepositoryから取得する
    // region Debug用
    var random = math.Random();
    var notBeginTodoDtoList = [
      for (var i = 0; i < 3; i++) ...[
        TodoDto('notBegin', random.nextInt(3) + 1, random.nextInt(3) + 1,
            random.nextInt(4) + 1)
      ]
    ];
    var progressTodoDtoList = [
      for (var i = 0; i < 3; i++) ...[
        TodoDto('progress', random.nextInt(3) + 1, random.nextInt(3) + 1,
            random.nextInt(4) + 1)
      ]
    ];
    var stayTodoDtoList = [
      for (var i = 0; i < 3; i++) ...[
        TodoDto('stay', random.nextInt(3) + 1, random.nextInt(3) + 1,
            random.nextInt(4) + 1)
      ]
    ];
    var completeTodoDtoList = [
      for (var i = 0; i < 3; i++) ...[
        TodoDto('complete', random.nextInt(3) + 1, random.nextInt(3) + 1,
            random.nextInt(4) + 1)
      ]
    ];
// endregion

    return MainViewModelState(
      notBeginTodoDtoList: notBeginTodoDtoList,
      progressTodoDtoList: progressTodoDtoList,
      stayTodoDtoList: stayTodoDtoList,
      completeTodoDtoList: completeTodoDtoList,
    );
  }

  /// Todoを新規追加
  void addTodo(AddTodoEvent event) {
    // 新規追加されたTodoを取得
    // ステータスをチェック
    // ステータスから対応したタブのStateに格納
  }
}
