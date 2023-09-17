import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';

Todo createTodo(DateTime createAt, String title) {
  return Todo(
    createAt: createAt,
    title: title,
    emergencyPoint: 1,
    priorityPoint: 1,
    status: TabTitle.notBegin,
  );
}

void main() {
  testWidgets('Todoを登録できること', (tester) async {
    // given
    final todo = createTodo(DateTime.now(), 'title');
    final target = TodoListRepository();

    // when
    var actual = target.save(todo);

    // then
    expect(true, actual);
  });

  testWidgets('TodoListを取得できること', (tester) async {
    // given
    final target = TodoListRepository();

    // when
    var actualList = target.getTodoList();

    // then
    expect(actualList, []);
  });

  testWidgets('特定のTodoを更新できること', (tester) async {
    // given
    var updateTodo = Todo(
      createAt: DateTime.now(),
      title: '更新後の単体試験用タイトル2',
      emergencyPoint: 2,
      priorityPoint: 2,
      status: TabTitle.progress,
    );
    final target = TodoListRepository();

    // when
    final actual = target.update(updateTodo);

    // then
    expect(actual, true);
  });
}
