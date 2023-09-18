import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';

part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@Riverpod(dependencies: [])
class TodoList extends _$TodoList {
  @override
  TodoListState build() {
    var todoList = ref.watch(todoListRepositoryProvider).getTodoList();
    return TodoListState(todoList: todoList);
  }

  bool add(Todo todo) {
    if (!ref.watch(todoListRepositoryProvider).save(todo)) return false;
    state = state.add(todo);
    return true;
  }

  bool update(Todo newTodo) {
    if (!ref.watch(todoListRepositoryProvider).update(newTodo)) return false;
    state = state.update(newTodo);
    return true;
  }

  bool delete(Todo todo) {
    if (!ref.watch(todoListRepositoryProvider).delete(todo)) return false;
    state = state.delete(todo);
    return true;
  }
}

@freezed
abstract class TodoListState with _$TodoListState {
  factory TodoListState({
    required List<Todo> todoList,
  }) = _TodoListState;
  TodoListState._();

  List<Todo> getNotBeginTodoList() =>
      todoList.where((element) => element.status == TabTitle.notBegin).toList();
  List<Todo> getProgressTodoList() =>
      todoList.where((element) => element.status == TabTitle.progress).toList();
  List<Todo> getStayTodoList() =>
      todoList.where((element) => element.status == TabTitle.stay).toList();
  List<Todo> getCompleteTodoList() =>
      todoList.where((element) => element.status == TabTitle.complete).toList();
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
