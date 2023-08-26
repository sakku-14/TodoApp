import '../../Domain/Todo/todo.dart';

class TodoListRepository {
  final List<Todo> _todoList = <Todo>[];

  /// Todoを新規追加
  bool save(Todo todo) {
    // 保存処理
    try {
      final newTodo = todo.copyWith(
        createDateTime: todo.createDateTime,
        title: todo.title,
        emergencyPoint: todo.emergencyPoint,
        priorityPoint: todo.priorityPoint,
        status: todo.status,
      );

      _todoList.add(newTodo);
      return true;
    } catch (e) {
      return false;
    }
  }
}
