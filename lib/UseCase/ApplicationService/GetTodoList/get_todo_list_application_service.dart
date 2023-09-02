import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../Infrastructure/Repository/todo_list_repository.dart';
import '../../../ViewModel/Dto/todo_dto.dart';

part 'get_todo_list_application_service.g.dart';

class GetTodoListApplicationService {
  late final TodoListRepository todoListRepository;

  GetTodoListApplicationService(this.todoListRepository);

  /// Todoを新規登録
  List<TodoDto> getTodoList() {
    var todoList = todoListRepository.getTodoList();
    // TodoListが空の場合は空のTodoDtoListを返す
    if (todoList.isEmpty) {
      return List<TodoDto>.empty();
    }

    // TodoListからTodoDtoListに変換
    var todoDtoList = [
      for (var i = 0; i < todoList.length; i++) ...[
        TodoDto(
          todoList[i].title,
          todoList[i].emergencyPoint,
          todoList[i].priorityPoint,
          todoList[i].status,
        )
      ]
    ];
    return todoDtoList;
  }
}

@riverpod
GetTodoListApplicationService getTodoListApplicationService(
    GetTodoListApplicationServiceRef ref) {
  return GetTodoListApplicationService(
      ref.watch(todoListRepositoryProvider.notifier));
}
