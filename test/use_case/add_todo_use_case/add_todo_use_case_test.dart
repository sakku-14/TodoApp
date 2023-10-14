import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/use_case/use_case.dart';

import 'add_todo_use_case_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TodoList>(),
])
void main() {
  final MockTodoList todoListProvider = MockTodoList();
  setUp(() {
    reset(todoListProvider);
  });

  testWidgets('Todo登録処理を呼び出せること', (tester) async {
    final useCase = AddTodoUseCase(todoListProvider);
    var todoDto = TodoDto('単体試験用タイトル', 1, 1, TodoStatus.notBegin);
    when(todoListProvider.addTodo(any)).thenAnswer((_) async => true);

    useCase.execute(todoDto);

    verify(todoListProvider.addTodo(any)).called(1);
  });
}
