import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infrastructure/infrastructure.dart';
import '../model.dart';

part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@Riverpod(dependencies: [])
class TodoList extends _$TodoList {
  @override
  FutureOr<TodoListState> build() async {
    var todoList = await ref.watch(todoListRepositoryProvider).getTodoList();
    return TodoListState(todoList: todoList);
  }

  Future<bool> addTodo(Todo todo) async {
    if (!await ref.watch(todoListRepositoryProvider).save(todo)) return false;

    ref.invalidateSelf();
    await future;
    return true;
  }

  Future<bool> updateTodo(Todo newTodo) async {
    if (!await ref.watch(todoListRepositoryProvider).update(newTodo)) {
      return false;
    }

    ref.invalidateSelf();
    await future;
    return true;
  }

  Future<bool> deleteTodo(Todo todo) async {
    if (!await ref.watch(todoListRepositoryProvider).delete(todo)) return false;

    ref.invalidateSelf();
    await future;
    return true;
  }
}

@freezed
class TodoListState with _$TodoListState {
  factory TodoListState({
    required List<Todo> todoList,
  }) = _TodoListState;
  TodoListState._();

  late final notBeginTodoList = todoList
      .where((element) => element.status == TodoStatus.notBegin)
      .toList();
  late final progressTodoList = todoList
      .where((element) => element.status == TodoStatus.progress)
      .toList();
  late final stayTodoList =
      todoList.where((element) => element.status == TodoStatus.stay).toList();
  late final completeTodoList = todoList
      .where((element) => element.status == TodoStatus.complete)
      .toList();
  Todo getTodo(DateTime createAt) => todoList
      .where((element) => element.createAt == createAt)
      .toList()
      .elementAt(0);

  TodoListState add(Todo todo) => TodoListState(todoList: [...todoList, todo]);

  TodoListState update(Todo todo) {
    var index =
        todoList.indexWhere((element) => element.createAt == todo.createAt);

    var list = [...todoList];
    list[index] = todo;
    return TodoListState(todoList: list);
  }

  TodoListState delete(Todo todo) =>
      TodoListState(todoList: [...todoList]..remove(todo));
}
