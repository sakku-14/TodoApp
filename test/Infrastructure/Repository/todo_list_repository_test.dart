import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/Domain/Todo/todo.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';

Todo createTodo(String title) {
  return Todo(
    createDateTime: DateTime.now(),
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
}
