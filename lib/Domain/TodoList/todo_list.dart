import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Domain/TodoList/todo.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';

part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@riverpod
Future<TodoList> todoList(TodoListRef ref) async {
  // DBから取得する処理と想定
  await Future.delayed(const Duration(seconds: 0));
  var todoList = ref.watch(todoListRepositoryProvider).getTodoList();

  // 今は初期のTodoは空（メモリ上でしか保持していないから）
  return TodoList(todoList: todoList);
}

@freezed
abstract class TodoList with _$TodoList {
  factory TodoList({
    required List<Todo> todoList,
  }) = _TodoList;
  TodoList._();

  List<Todo> getNotBeginTodoList() =>
      this.todoList.where((element) => element.status == 1).toList();
  List<Todo> getProgressTodoList() =>
      this.todoList.where((element) => element.status == 2).toList();
  List<Todo> getStayTodoList() =>
      this.todoList.where((element) => element.status == 3).toList();
  List<Todo> getCompleteTodoList() =>
      this.todoList.where((element) => element.status == 4).toList();
}
