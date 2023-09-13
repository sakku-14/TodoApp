import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Domain/TodoList/todo.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

part 'update_todo_use_case.g.dart';

class UpdateTodoUseCase {
  late final TodoListRepository todoListRepository;

  UpdateTodoUseCase(this.todoListRepository);

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
    if (!todoListRepository.update(todo)) return;

    // 更新処理が正常に完了したらDomainEvent通知
    // eventBus.fire(UpdateTodoEvent());
  }
}

@riverpod
UpdateTodoUseCase updateTodoUseCase(UpdateTodoUseCaseRef ref) {
  return UpdateTodoUseCase(ref.watch(todoListRepositoryProvider.notifier));
}
