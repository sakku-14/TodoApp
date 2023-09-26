import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/Entities/TodoStatus/todo_status.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';

class DummyTodoList extends TodoList {
  @override
  TodoListState build() {
    return dummyTodoList();
  }
}

TodoListState dummyTodoList() => TodoListState(
      todoList: [
        ..._TodoListFactory.todoListFactory(TodoStatus.notBegin),
        ..._TodoListFactory.todoListFactory(TodoStatus.progress),
        ..._TodoListFactory.todoListFactory(TodoStatus.stay),
        ..._TodoListFactory.todoListFactory(TodoStatus.complete),
      ],
    );

class _TodoListFactory {
  static Todo todoFactory(int createOrder, int emergencyPoint,
          int priorityPoint, TodoStatus status) =>
      Todo(
          createAt: DateTime(createOrder),
          title: 'title',
          emergencyPoint: emergencyPoint,
          priorityPoint: priorityPoint,
          status: status);

  static int todoListIndex = 0;

  static List<Todo> todoListFactory(TodoStatus status) => [
        todoFactory(todoListIndex, 1, 1, status),
        todoFactory(++todoListIndex, 1, 2, status),
        todoFactory(++todoListIndex, 2, 1, status),
        todoFactory(++todoListIndex, 2, 2, status),
        todoFactory(++todoListIndex, 2, 3, status),
        todoFactory(++todoListIndex, 3, 1, status),
        todoFactory(++todoListIndex, 3, 2, status),
        todoFactory(++todoListIndex, 3, 3, status),
      ];
}
