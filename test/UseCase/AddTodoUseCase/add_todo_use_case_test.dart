import 'package:event_bus/event_bus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';
import 'package:todo_app/UseCase/AddTodoUseCase/add_todo_use_case.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';
import 'package:todo_app/ViewModel/MainViewModel/main_view_model.dart';

import 'add_todo_use_case_test.mocks.dart';

@GenerateMocks([
  TodoListRepository,
  MainViewModel,
  EventBus,
])
void main() {
  late MockTodoListRepository todoListRepository;
  late MockMainViewModel mainViewModel;
  late MockEventBus eventBus;
  setUp(() {
    todoListRepository = MockTodoListRepository();
    mainViewModel = MockMainViewModel();
    eventBus = MockEventBus();
  });

  testWidgets('Todoを登録できた場合はイベント発行できること', (tester) async {
    final useCase = AddTodoUseCase(todoListRepository);
    var todoDto = TodoDto('単体試験用タイトル', 1, 1, 1);
    when(todoListRepository.save(any)).thenReturn(true);

    useCase.execute(todoDto);

    verify(todoListRepository.save(any)).called(1);
    // verify(mainViewModel.addTodo(AddTodoEvent())).called(1);
  });

  testWidgets('Todoの登録に失敗した場合はイベント発行されないこと', (tester) async {
    final useCase = AddTodoUseCase(todoListRepository);
    var todoDto = TodoDto('単体試験用タイトル', 1, 1, 1);
    when(todoListRepository.save(any)).thenReturn(false);

    useCase.execute(todoDto);

    verify(todoListRepository.save(any)).called(1);
    // verify(mainViewModel.addTodo(AddTodoEvent())).called(1);
  });
}
