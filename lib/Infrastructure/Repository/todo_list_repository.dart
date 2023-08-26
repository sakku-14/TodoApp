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

      _todoList.add(clone(newTodo));
      return true;
    } catch (e) {
      return false;
    }
  }

  /// TodoListを取得
  List<Todo> getTodoList() {
    List<Todo> todoList = [];
    for (int i = 0; i < _todoList.length; i++) {
      todoList.add(clone(_todoList[i]));
    }
    return todoList;
  }

  /// Todoのクローン生成
  Todo clone(Todo todo) {
    return Todo(
      createDateTime: todo.createDateTime,
      title: todo.title,
      emergencyPoint: todo.emergencyPoint,
      priorityPoint: todo.priorityPoint,
      status: todo.status,
    );
  }
}
