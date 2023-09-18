import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/UseCase/Dto/todo_dto.dart';

part 'delete_todo_use_case.g.dart';

class DeleteTodoUseCase {
  late TodoList todoListProvider;

  DeleteTodoUseCase(this.todoListProvider);

  /// Todoを削除
  bool execute(TodoDto todoDto) {
    // TodoDtoをTodoに変換
    var todo = Todo(
      createAt: todoDto.createAt!,
      title: todoDto.title,
      emergencyPoint: todoDto.emergencyPoint,
      priorityPoint: todoDto.priorityPoint,
      status: todoDto.status,
    );

    // 削除対象Todoを特定してRepositoryから削除
    if (!todoListProvider.delete(todo)) return false;

    return true;
  }
}

@Riverpod(dependencies: [TodoList])
DeleteTodoUseCase deleteTodoUseCase(DeleteTodoUseCaseRef ref) {
  return DeleteTodoUseCase(
    ref.watch(todoListProvider.notifier),
  );
}
