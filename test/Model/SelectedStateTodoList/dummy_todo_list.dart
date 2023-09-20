import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';

class DummyTodoList extends TodoList {
  @override
  TodoListState build() {
    return dummyTodoList();
  }
}

TodoListState dummyTodoList() => TodoListState(
      todoList: [
        ..._TodoListFactory.todoListFactory(TabTitle.notBegin),
        ..._TodoListFactory.todoListFactory(TabTitle.progress),
        ..._TodoListFactory.todoListFactory(TabTitle.stay),
        ..._TodoListFactory.todoListFactory(TabTitle.complete),
      ],
    );

class _TodoListFactory {
  static Todo todoFactory(int createOrder, int emergencyPoint,
          int priorityPoint, TabTitle status) =>
      Todo(
          createAt: DateTime(createOrder),
          title: 'title',
          emergencyPoint: emergencyPoint,
          priorityPoint: priorityPoint,
          status: status);

  static int todoListIndex = 0;

  static List<Todo> todoListFactory(TabTitle status) => [
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
