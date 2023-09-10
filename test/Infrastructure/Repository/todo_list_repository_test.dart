import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/Domain/Todo/todo.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';

Todo createTodo(String title) {
  return Todo(
    createAt: DateTime.now(),
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
      var todo = createTodo('単体試験用タイトル$i');
      todoListRepository.save(todo);
    }

    expect(todoListRepository.getTodoList().length, todoCount);
  });

  testWidgets('TodoListを取得できること', (tester) async {
    var todoListRepository = TodoListRepository();
    var todoCount = 5;
    for (var i = 0; i < todoCount; i++) {
      var todo = createTodo('単体試験用タイトル$i');
      todoListRepository.save(todo);
    }

    var actualList = todoListRepository.getTodoList();
    for (var i = 0; i < todoCount; i++) {
      expect(actualList[i].title, '単体試験用タイトル$i');
    }
  });

  testWidgets('特定のTodoを更新できること', (tester) async {
    var todoListRepository = TodoListRepository();
    var todoCount = 5;

    var initTodoList = <Todo>[];
    // テスト用のTodoをRepositoryに登録
    for (int i = 0; i < todoCount; i++) {
      var initTodo = createTodo('単体試験用タイトル$i');
      todoListRepository.save(initTodo);
      initTodoList.add(initTodo);
    }

    var updateTodoList = <Todo>[];
    // 更新用のTodoを生成
    for (int i = 0; i < todoCount; i++) {
      var updateTodo = Todo(
        createAt: initTodoList[i].createAt,
        title: '更新後の単体試験用タイトル$i',
        emergencyPoint: 2,
        priorityPoint: 2,
        status: 2,
      );
      updateTodoList.add(updateTodo);
    }

    // 更新用処理を実行
    for (int i = 0; i < todoCount; i++) {
      todoListRepository.update(updateTodoList[i]);
    }

    // 更新後のTodoListを取得
    var updatedTodoList = todoListRepository.getTodoList();

    // 更新されたことを確認
    for (int i = 0; i < todoCount; i++) {
      expect(updatedTodoList[i].title, updateTodoList[i].title);
      expect(
          updatedTodoList[i].emergencyPoint, updateTodoList[i].emergencyPoint);
      expect(updatedTodoList[i].priorityPoint, updateTodoList[i].priorityPoint);
      expect(updatedTodoList[i].status, updateTodoList[i].status);
    }
  });
}
