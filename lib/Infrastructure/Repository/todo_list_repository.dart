import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Domain/Todo/todo.dart';

part 'todo_list_repository.g.dart';

@riverpod
class TodoListRepository extends _$TodoListRepository {
  final List<Todo> _todoList = <Todo>[];

  @override
  TodoListRepository build() {
    return TodoListRepository();
  }

  /// Todoを新規追加
  bool save(Todo todo) {
    // 保存処理
    try {
      final newTodo = todo.copyWith(
        createAt: todo.createAt,
        title: todo.title,
        emergencyPoint: todo.emergencyPoint,
        priorityPoint: todo.priorityPoint,
        status: todo.status,
      );

      _todoList.add(clone(newTodo));
      return true;
    } catch (e) {
      return false;
    }
  }

  /// TodoListを取得
  List<Todo> getTodoList() {
    try {
      List<Todo> todoList = [];
      for (int i = 0; i < _todoList.length; i++) {
        todoList.add(clone(_todoList[i]));
      }
      return todoList;
    } catch (e) {
      return List<Todo>.empty();
    }
  }

  /// 特定のTodoを更新
  bool update(Todo todo) {
    int index;
    try {
      index =
          _todoList.indexWhere((element) => element.createAt == todo.createAt);
    } catch (e) {
      return false;
    }

    // 要素が見つからない場合、-1が返される
    if (index == -1) return false;

    _todoList[index] = Todo(
      createAt: todo.createAt,
      title: todo.title,
      emergencyPoint: todo.emergencyPoint,
      priorityPoint: todo.priorityPoint,
      status: todo.status,
    );

    return true;
  }

  /// Todoのクローン生成
  Todo clone(Todo todo) {
    return Todo(
      createAt: todo.createAt,
      title: todo.title,
      emergencyPoint: todo.emergencyPoint,
      priorityPoint: todo.priorityPoint,
      status: todo.status,
    );
  }
}
