import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/UseCase/DeleteTodoUseCase/delete_todo_use_case.dart';
import 'package:todo_app/UseCase/Dto/todo_dto.dart';

import 'delete_todo_use_case_test.mocks.dart';

@GenerateMocks([
  TodoList,
])
void main() {
  late MockTodoList todoListProvider;
  setUp(() {
    todoListProvider = MockTodoList();
  });

  testWidgets('Todo削除処理を呼び出せること', (tester) async {
    final useCase = DeleteTodoUseCase(todoListProvider);
    var todoDto = TodoDto(
      '単体試験用タイトル',
      1,
      1,
      TabTitle.notBegin,
      createAt: DateTime.now(),
    );
    when(todoListProvider.delete(any)).thenReturn(true);

    useCase.execute(todoDto);

    verify(todoListProvider.delete(any)).called(1);
  });
}
