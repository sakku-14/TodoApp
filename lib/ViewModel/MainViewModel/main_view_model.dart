import 'dart:async';
import 'dart:math' as math;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/UseCase/ApplicationService/GetTodoList/get_todo_list_application_service.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

import 'main_view_model_state.dart';

part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  late GetTodoListApplicationService _getTodoListApplicationService;

  StreamSubscription? _myEvent;

  MainViewModel() {
    // _myEvent = eventBus.on<AddTodoEvent>().listen((event) => addTodo());
    // _myEvent = eventBus.on<UpdateTodoEvent>().listen((event) => addTodo());
  }

  @override
  MainViewModelState build() {
    _getTodoListApplicationService =
        ref.watch(getTodoListApplicationServiceProvider);

    ref.onDispose(() {
      _myEvent?.cancel();
    });

    // TODO:23.8.19:A.Uehara:MainView生成時にDebug用Todoを生成せいているが、本来はRepositoryから取得する
    // region Debug用
    var random = math.Random();
    var notBeginTodoDtoList = [
      for (var i = 0; i < 3; i++) ...[
        TodoDto(DateTime.now(), 'notBegin', random.nextInt(3) + 1,
            random.nextInt(3) + 1, random.nextInt(4) + 1)
      ]
    ];
    var progressTodoDtoList = [
      for (var i = 0; i < 3; i++) ...[
        TodoDto(DateTime.now(), 'progress', random.nextInt(3) + 1,
            random.nextInt(3) + 1, random.nextInt(4) + 1)
      ]
    ];
    var stayTodoDtoList = [
      for (var i = 0; i < 3; i++) ...[
        TodoDto(DateTime.now(), 'stay', random.nextInt(3) + 1,
            random.nextInt(3) + 1, random.nextInt(4) + 1)
      ]
    ];
    var completeTodoDtoList = [
      for (var i = 0; i < 3; i++) ...[
        TodoDto(DateTime.now(), 'complete', random.nextInt(3) + 1,
            random.nextInt(3) + 1, random.nextInt(4) + 1)
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
  void addTodo() {
    // 新規追加されたTodoを取得
    var todoList = _getTodoListApplicationService.getTodoList();

    List<TodoDto> notBeginTodoDtoList = [];
    List<TodoDto> progressTodoDtoList = [];
    List<TodoDto> stayTodoDtoList = [];
    List<TodoDto> completeTodoDtoList = [];

    // ステータスをチェック
    for (int i = 0; i < todoList.length; i++) {
      switch (todoList[i].status) {
        case 1:
          notBeginTodoDtoList.add(todoList[i]);
        case 2:
          progressTodoDtoList.add(todoList[i]);
        case 3:
          stayTodoDtoList.add(todoList[i]);
        case 4:
          completeTodoDtoList.add(todoList[i]);
      }
    }

    // Viewを更新
    state = state.copyWith(
      notBeginTodoDtoList: notBeginTodoDtoList,
      progressTodoDtoList: progressTodoDtoList,
      stayTodoDtoList: stayTodoDtoList,
      completeTodoDtoList: completeTodoDtoList,
    );
  }
}
