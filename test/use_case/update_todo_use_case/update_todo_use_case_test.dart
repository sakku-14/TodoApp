import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/use_case/use_case.dart';

import 'update_todo_use_case_test.mocks.dart';

@GenerateMocks([
  TodoList,
])
void main() {
  final MockTodoList todoListProvider = MockTodoList();
  setUp(() {
    reset(todoListProvider);
  });

  testWidgets('Todo更新処理を呼び出せること', (tester) async {
    var todoDto = TodoDto(
      '単体試験用タイトル',
      1,
      1,
      TodoStatus.notBegin,
      createAt: DateTime.now(),
    );
    var todo = Todo(
        createAt: todoDto.createAt!,
        title: todoDto.title,
        emergencyPoint: todoDto.emergencyPoint,
        priorityPoint: todoDto.priorityPoint,
        status: todoDto.status);
    when(todoListProvider.updateTodo(todo)).thenAnswer((_) async => true);
    final useCase = UpdateTodoUseCase(todoListProvider);

    useCase.execute(todoDto);

    verify(todoListProvider.updateTodo(todo)).called(1);
  });
}
