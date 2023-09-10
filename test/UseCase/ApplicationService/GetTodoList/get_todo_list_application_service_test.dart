import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/Domain/Todo/todo.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';
import 'package:todo_app/UseCase/ApplicationService/GetTodoList/get_todo_list_application_service.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

import 'get_todo_list_application_service_test.mocks.dart';

@GenerateMocks([
  TodoListRepository,
])
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
  late MockTodoListRepository todoListRepository;
  setUp(() {
    todoListRepository = MockTodoListRepository();
  });

  testWidgets('TodoListを取得してTodoDtoListに変換できること', (tester) async {
    final applicationService =
        GetTodoListApplicationService(todoListRepository);

    List<Todo> todoList = [];
    var todoCount = 5;
    for (var i = 0; i < todoCount; i++) {
      var todo = createTodo('単体試験用タイトル$i');
      todoList.add(todo);
    }
    when(todoListRepository.getTodoList()).thenReturn(todoList);

    var actualTodoDtoList = applicationService.getTodoList();

    // Repositoryの取得メソッドが呼ばれること
    verify(todoListRepository.getTodoList()).called(1);

    // TodoList → TodoDtoListに変換できていること
    expect(actualTodoDtoList.runtimeType, List<TodoDto>);
  });

  testWidgets('TodoListの取得に失敗した場合は空のTodoDtoListを返すこと', (tester) async {
    final applicationService =
        GetTodoListApplicationService(todoListRepository);

    when(todoListRepository.getTodoList()).thenReturn(List<Todo>.empty());

    var actualTodoDtoList = applicationService.getTodoList();

    // 空のTodoDtoListを返すこと
    expect(actualTodoDtoList, List<TodoDto>.empty());
  });
}
