import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Infrastructure/Repository/todo_list_repository.dart';

part 'update_todo_use_case.g.dart';

class UpdateTodoUseCase {
  final TodoListRepository todoListRepository;

  UpdateTodoUseCase(this.todoListRepository);

  /// 更新されたTodoを更新
  void execute(String title) {
    // 変更されたTodoを特定してRepositoryを更新
    if (!todoListRepository.save(title)) return;

    // 更新処理が正常に完了したらEvent通知
  }
}

@riverpod
UpdateTodoUseCase updateTodoUseCase(UpdateTodoUseCaseRef ref) {
  return UpdateTodoUseCase(ref.watch(todoListRepositoryProvider.notifier));
}
