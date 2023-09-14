import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Domain/TodoList/todo.dart';
import 'package:todo_app/Domain/TodoList/todo_list.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

part 'update_todo_use_case.g.dart';

class UpdateTodoUseCase {
  late TodoList todoListProvider;

  UpdateTodoUseCase(this.todoListProvider);

  /// 更新されたTodoを更新
  void execute(TodoDto todoDto) {
    // TodoDtoをTodoに変換
    var todo = Todo(
      createAt: todoDto.createAt!,
      title: todoDto.title,
      emergencyPoint: todoDto.emergencyPoint,
      priorityPoint: todoDto.priorityPoint,
      status: todoDto.status,
    );

    // 変更されたTodoを特定してRepositoryを更新
    todoListProvider.update(todo);
  }
}

@riverpod
UpdateTodoUseCase updateTodoUseCase(UpdateTodoUseCaseRef ref) {
  return UpdateTodoUseCase(
    ref.watch(todoListProvider.notifier),
  );
}
