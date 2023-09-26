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
    state = AsyncValue.data(state.value!.add(todo));
    return true;
  }

  Future<bool> updateTodo(Todo newTodo) async {
    if (!await ref.watch(todoListRepositoryProvider).update(newTodo)) {
      return false;
    }
    state = AsyncValue.data(state.value!.update(newTodo));
    return true;
  }

  Future<bool> deleteTodo(Todo todo) async {
    if (!await ref.watch(todoListRepositoryProvider).delete(todo)) return false;
    state = AsyncValue.data(state.value!.delete(todo));
    return true;
  }
}

@freezed
abstract class TodoListState with _$TodoListState {
  factory TodoListState({
    required List<Todo> todoList,
  }) = _TodoListState;
  TodoListState._();

  List<Todo> getNotBeginTodoList() => todoList
      .where((element) => element.status == TodoStatus.notBegin)
      .toList();
  List<Todo> getProgressTodoList() => todoList
      .where((element) => element.status == TodoStatus.progress)
      .toList();
  List<Todo> getStayTodoList() =>
      todoList.where((element) => element.status == TodoStatus.stay).toList();
  List<Todo> getCompleteTodoList() => todoList
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
