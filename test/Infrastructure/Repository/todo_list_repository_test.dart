import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/Domain/TodoList/todo.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';

Todo createTodo(DateTime createAt, String title) {
  return Todo(
    createAt: createAt,
    title: title,
    emergencyPoint: 1,
    priorityPoint: 1,
    status: 1,
  );
}

void main() {
  testWidgets('Todoを登録できること', (tester) async {
    var todoListRepository = TodoListRepository();
    var todoCount = 5;
    for (var i = 0; i < todoCount; i++) {
      var todo = createTodo(DateTime.now(), '単体試験用タイトル$i');
      todoListRepository.save(todo);
    }

    expect(todoListRepository.getTodoList().length, todoCount);
  });

  testWidgets('TodoListを取得できること', (tester) async {
    var todoListRepository = TodoListRepository();
    var todoCount = 5;
    for (var i = 0; i < todoCount; i++) {
      var todo = createTodo(DateTime.now(), '単体試験用タイトル$i');
      todoListRepository.save(todo);
    }

    var actualList = todoListRepository.getTodoList();
    for (var i = 0; i < todoCount; i++) {
      expect(actualList[i].title, '単体試験用タイトル$i');
    }
  });

  testWidgets('特定のTodoを更新できること', (tester) async {
    var todoListRepository = TodoListRepository();

    var initTodoDate1 = DateTime.now();
    var initTodoDate2 = DateTime.now();
    var initTodoDate3 = DateTime.now();

    var initTodo1 = createTodo(initTodoDate1, '単体試験用タイトル1');
    var initTodo2 = createTodo(initTodoDate2, '単体試験用タイトル2');
    var initTodo3 = createTodo(initTodoDate3, '単体試験用タイトル3');
    todoListRepository.save(initTodo1);
    todoListRepository.save(initTodo2);
    todoListRepository.save(initTodo3);

    var updateTodo = Todo(
      createAt: initTodo2.createAt,
      title: '更新後の単体試験用タイトル2',
      emergencyPoint: 2,
      priorityPoint: 2,
      status: 2,
    );

    // 更新用処理を実行
    todoListRepository.update(updateTodo);

    // 更新後のTodoListを取得
    var updatedTodoList = todoListRepository.getTodoList();

    // 更新されたことを確認
    var updatedTodo = updatedTodoList
        .firstWhere((element) => element.createAt == updateTodo.createAt);
    expect(updatedTodo.title, '更新後の単体試験用タイトル2');
    expect(updatedTodo.emergencyPoint, 2);
    expect(updatedTodo.priorityPoint, 2);
    expect(updatedTodo.status, 2);
  });
}
