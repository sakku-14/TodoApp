import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/model.dart';
import '../use_case.dart';

part 'delete_todo_use_case.g.dart';

class DeleteTodoUseCase {
  late TodoList todoListProvider;

  DeleteTodoUseCase(this.todoListProvider);

  /// Todoを削除
  Future<bool> execute(TodoDto todoDto) async {
    // TodoDtoをTodoに変換
    var todo = Todo(
      createAt: todoDto.createAt!,
      title: todoDto.title,
      emergencyPoint: todoDto.emergencyPoint,
      priorityPoint: todoDto.priorityPoint,
      status: todoDto.status,
    );

    // 削除対象Todoを特定してRepositoryから削除
    if (!await todoListProvider.deleteTodo(todo)) return false;

    return true;
  }
}

@Riverpod(dependencies: [TodoList])
DeleteTodoUseCase deleteTodoUseCase(DeleteTodoUseCaseRef ref) {
  return DeleteTodoUseCase(
    ref.watch(todoListProvider.notifier),
  );
}
