import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/UseCase/Dto/todo_dto.dart';

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

    // Repositoryへ新規登録
    todoListProvider.add(todo);

    return true;
  }
}

@Riverpod(dependencies: [TodoList])
AddTodoUseCase addTodoUseCase(AddTodoUseCaseRef ref) {
  return AddTodoUseCase(
    ref.watch(todoListProvider.notifier),
  );
}
