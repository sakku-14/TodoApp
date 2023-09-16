import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';

part 'todo_list_repository.g.dart';

class TodoListRepository {
  /// Todoを新規追加
  bool save(Todo todo) {
    // 保存処理
    try {
      // 本来はここでDBへ保存処理

      return true;
    } catch (e) {
      return false;
    }
  }

  /// TodoListを取得
  List<Todo> getTodoList() {
    try {
      // 本来はここでDBへ取得処理
      return [];
    } catch (e) {
      return List<Todo>.empty();
    }
  }

  /// 特定のTodoを更新
  bool update(Todo todo) {
    try {
      // 本来はここでDBへ更新処理
      return true;
    } catch (e) {
      return false;
    }
  }
}

@riverpod
TodoListRepository todoListRepository(TodoListRepositoryRef ref) {
  // 本来はここでDBサービスをwatchする
  return TodoListRepository();
}
