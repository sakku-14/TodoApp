import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository_state.dart';

part 'todo_list_repository.g.dart';

@riverpod
class TodoListRepository extends _$TodoListRepository {
  @override
  TodoListRepositoryState build() {
    return const TodoListRepositoryState();
  }

  bool save(String title) {
    // 保存処理
    try {
      state = state.copyWith(title: title);
      return true;
    } catch (e) {
      return false;
    }
  }
}
