import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';
import 'package:todo_app/UseCase/AddTodoUseCase/add_todo_use_case.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

import 'add_todo_use_case_test.mocks.dart';

@GenerateMocks([
  TodoListRepository,
])
void main() {
  late MockTodoListRepository todoListRepository;
  setUp(() {
    todoListRepository = MockTodoListRepository();
  });

  testWidgets('Todo登録処理を呼び出せること', (tester) async {
    final useCase = AddTodoUseCase(todoListRepository);
    var todoDto = TodoDto(DateTime.now(), '単体試験用タイトル', 1, 1, 1);
    when(todoListRepository.save(any)).thenReturn(true);

    useCase.execute(todoDto);

    verify(todoListRepository.save(any)).called(1);
  });
}
