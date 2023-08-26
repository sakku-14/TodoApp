import 'package:todo_app/Infrastructure/event_bus.dart';

import '../Domain/Event/add_todo_event.dart';
import '../Domain/Todo/todo.dart';
import '../Infrastructure/Repository/todo_list_repository.dart';
import '../ViewModel/Dto/todo_dto.dart';

class AddTodoUseCase {
  late final TodoListRepository todoListRepository;

  AddTodoUseCase(this.todoListRepository);

  /// Todoを新規登録
  void execute(TodoDto todoDto) {
    var todo = Todo(
      createDateTime: DateTime.now(),
      title: todoDto.title,
      emergencyPoint: todoDto.emergencyPoint,
      priorityPoint: todoDto.priorityPoint,
      status: todoDto.status,
    );

    // Repositoryへ新規登録
    if (!todoListRepository.save(todo)) return;

    // 更新処理が完了した時のみ通知
    eventBus.fire(AddTodoEvent());
  }
}
