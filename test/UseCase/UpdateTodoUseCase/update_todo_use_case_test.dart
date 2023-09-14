import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';
import 'package:todo_app/UseCase/Dto/todo_dto.dart';
import 'package:todo_app/UseCase/UpdateTodoUseCase/update_todo_use_case.dart';

import 'update_todo_use_case_test.mocks.dart';

@GenerateMocks([
  TodoListRepository,
])
void main() {
  late MockTodoListRepository todoListRepository;
  setUp(() {
    todoListRepository = MockTodoListRepository();
  });

  testWidgets('Todo更新処理を呼び出せること', (tester) async {
    final useCase = UpdateTodoUseCase(todoListRepository);
    var todoDto = TodoDto(DateTime.now(), '単体試験用タイトル', 1, 1, 1);
    when(todoListRepository.update(any)).thenReturn(true);

    useCase.execute(todoDto);

    verify(todoListRepository.update(any)).called(1);
  });
}
