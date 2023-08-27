import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Infrastructure/event_bus.dart';

import '../../Domain/Event/add_todo_event.dart';
import '../../Domain/Todo/todo.dart';
import '../../Infrastructure/Repository/todo_list_repository.dart';
import '../../ViewModel/Dto/todo_dto.dart';

part 'add_todo_use_case.g.dart';

class AddTodoUseCase {
  late final TodoListRepository todoListRepository;

  AddTodoUseCase(this.todoListRepository);

  /// Todoを新規登録
  bool execute(TodoDto todoDto) {
    var todo = Todo(
      createDateTime: DateTime.now(),
      title: todoDto.title,
      emergencyPoint: todoDto.emergencyPoint,
      priorityPoint: todoDto.priorityPoint,
      status: todoDto.status,
    );

    // Repositoryへ新規登録
    if (!todoListRepository.save(todo)) return false;

    // 更新処理が完了した時のみ通知
    eventBus.fire(AddTodoEvent());

    return true;
  }
}

@riverpod
AddTodoUseCase addTodoUseCase(AddTodoUseCaseRef ref) {
  return AddTodoUseCase(ref.watch(todoListRepositoryProvider.notifier));
}
