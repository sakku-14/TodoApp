import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/model.dart';
import '../infrastructure.dart';

part 'todo_list_repository.g.dart';

class TodoListRepository {
  late DbService? dbService;

  TodoListRepository(this.dbService);

  /// Todoを新規追加
  Future<bool> save(Todo todo) async {
    // 保存処理
    try {
      if (dbService == null) return false;

      return await dbService!.saveTodo(todo);
    } catch (e) {
      return false;
    }
  }

  /// TodoListを取得
  Future<List<Todo>> getTodoList() async {
    try {
      if (dbService == null) return List<Todo>.empty();

      return await dbService!.getTodoList();
    } catch (e) {
      return List<Todo>.empty();
    }
  }

  /// 特定のTodoを更新
  Future<bool> update(Todo todo) async {
    try {
      if (dbService == null) return false;

      return await dbService!.updateTodo(todo);
    } catch (e) {
      return false;
    }
  }

  /// 特定のTodoを削除
  Future<bool> delete(Todo todo) async {
    try {
      if (dbService == null) return false;

      return await dbService!.deleteTodo(todo.createAt);
    } catch (e) {
      return false;
    }
  }
}

@riverpod
TodoListRepository todoListRepository(TodoListRepositoryRef ref) {
  return TodoListRepository(ref.watch(dbServiceProvider));
}
