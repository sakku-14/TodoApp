import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/infrastructure/infrastructure.dart';
import 'package:todo_app/model/model.dart';

import 'todo_list_repository_test.mocks.dart';

Todo createTodo(DateTime createAt, String title) {
  return Todo(
    createAt: createAt,
    title: title,
    emergencyPoint: 1,
    priorityPoint: 1,
    status: TodoStatus.notBegin,
  );
}

@GenerateMocks([
  DbService,
])
void main() {
  final MockDbService dbService = MockDbService();

  setUp(() {
    reset(dbService);
  });

  testWidgets('Todoを登録できること', (tester) async {
    // given
    final todo = createTodo(DateTime.now(), 'title');
    when(dbService.saveTodo(todo)).thenAnswer((_) async => true);
    final target = TodoListRepository(dbService);

    // when
    var actual = await target.save(todo);

    // then
    expect(true, actual);
  });

  testWidgets('TodoListを取得できること', (tester) async {
    // given
    when(dbService.getTodoList()).thenAnswer((_) async => []);
    final target = TodoListRepository(dbService);

    // when
    var actualList = await target.getTodoList();

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
      status: TodoStatus.progress,
    );
    when(dbService.updateTodo(updateTodo)).thenAnswer((_) async => true);
    final target = TodoListRepository(dbService);

    // when
    final actual = await target.update(updateTodo);

    // then
    expect(actual, true);
  });
}
