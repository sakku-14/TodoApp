import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Domain/Tab/tab.dart';
import 'package:todo_app/Domain/TodoList/todo.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';

part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  TodoListState build() {
    var todoList = ref.watch(todoListRepositoryProvider.notifier).getTodoList();
    return TodoListState(todoList: todoList);
  }

  void add(Todo todo) {
    state = state.add(todo);
  }

  void update(Todo newTodo) {
    state = state.update(newTodo);
  }

  void delete(Todo todo) {
    state = state.delete(todo);
  }
}

@freezed
abstract class TodoListState with _$TodoListState {
  factory TodoListState({
    required List<Todo> todoList,
  }) = _TodoListState;
  TodoListState._();

  List<Todo> getNotBeginTodoList() =>
      todoList.where((element) => element.status == TabState.notBegin).toList();
  List<Todo> getProgressTodoList() =>
      todoList.where((element) => element.status == TabState.progress).toList();
  List<Todo> getStayTodoList() =>
      todoList.where((element) => element.status == TabState.stay).toList();
  List<Todo> getCompleteTodoList() =>
      todoList.where((element) => element.status == TabState.complete).toList();
  Todo getTodo(DateTime createAt) => todoList
      .where((element) => element.createAt == createAt)
      .toList()
      .elementAt(0);

  TodoListState add(Todo todo) {
    return TodoListState(todoList: [...todoList, todo]);
  }

  TodoListState update(Todo todo) {
    return TodoListState(
        todoList: [...todoList]
          ..removeWhere((element) => element.createAt == todo.createAt)
          ..add(todo));
  }

  TodoListState delete(Todo todo) {
    todoList.remove(todo);
    return TodoListState(todoList: todoList);
  }
}
