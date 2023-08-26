import '../../Infrastructure/Repository/todo_list_repository.dart';
import '../../ViewModel/Dto/todo_dto.dart';

class GetTodoListApplicationService {
  late final TodoListRepository todoListRepository;

  GetTodoListApplicationService(this.todoListRepository);

  /// Todoを新規登録
  List<TodoDto> getTodoList() {
    var todoList = todoListRepository.getTodoList();

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
