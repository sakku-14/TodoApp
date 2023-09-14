import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Domain/TodoList/todo.dart';

part 'todo_list_repository.g.dart';

class TodoListRepository {
  // late TodoList todoListProvider;
  //
  // TodoListRepository(this.todoListProvider);

  /// Todoを新規追加
  bool save(Todo todo) {
    // 保存処理
    try {
      // 本来はここでDBへ保存処理

      // todoListProvider.add(todo);

      return true;
    } catch (e) {
      return false;
    }
  }

  /// TodoListを取得
  List<Todo> getTodoList() {
    try {
      // 本来はここでDBへ取得処理

      // return todoListProvider.state.todoList;
      return [];
    } catch (e) {
      return List<Todo>.empty();
    }
  }

  /// 特定のTodoを更新
  bool update(Todo todo) {
    try {
      // 本来はここでDBへ更新処理

      // todoListProvider.update(todo);
    } catch (e) {
      return false;
    }
    return true;
  }
}

// @riverpod
// TodoListRepository todoListRepository(TodoListRepositoryRef ref) {
//   return TodoListRepository(
//     ref.read(todoListProvider.notifier),
//   );
// }
@riverpod
TodoListRepository todoListRepository(TodoListRepositoryRef ref) {
  // 本来はここでDBサービスをwatchする
  return TodoListRepository();
}
