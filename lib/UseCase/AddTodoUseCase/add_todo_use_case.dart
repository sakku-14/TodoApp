import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Domain/TodoList/todo.dart';
import 'package:todo_app/Domain/TodoList/todo_list.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

part 'add_todo_use_case.g.dart';

class AddTodoUseCase {
  late final TodoListRepository todoListRepository;
  late TodoList todoListProvider;

  AddTodoUseCase(this.todoListRepository, this.todoListProvider);

  /// Todoを新規登録
  bool execute(TodoDto todoDto) {
    var todo = Todo(
      createAt: DateTime.now(),
      title: todoDto.title,
      emergencyPoint: todoDto.emergencyPoint,
      priorityPoint: todoDto.priorityPoint,
      status: todoDto.status,
    );

    // Repositoryへ新規登録
    if (!todoListRepository.save(todo)) return false;
    todoListProvider.add(todo);
    return true;
  }
}

@riverpod
AddTodoUseCase addTodoUseCase(AddTodoUseCaseRef ref) {
  return AddTodoUseCase(
    ref.watch(todoListRepositoryProvider.notifier),
    ref.watch(todoListProvider.notifier),
  );
}
