import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/model.dart';
import '../use_case.dart';

part 'add_todo_use_case.g.dart';

class AddTodoUseCase {
  late TodoList todoListProvider;

  AddTodoUseCase(this.todoListProvider);

  /// Todoを新規登録
  bool execute(TodoDto todoDto) {
    var todo = Todo(
      createAt: DateTime.now(),
      title: todoDto.title,
      emergencyPoint: todoDto.emergencyPoint,
      priorityPoint: todoDto.priorityPoint,
      status: todoDto.status,
    );

    print('hello');

    // Repositoryへ新規登録
    todoListProvider.addTodo(todo);

    return true;
  }
}

@Riverpod(dependencies: [TodoList])
AddTodoUseCase addTodoUseCase(AddTodoUseCaseRef ref) {
  return AddTodoUseCase(
    ref.watch(todoListProvider.notifier),
  );
}
