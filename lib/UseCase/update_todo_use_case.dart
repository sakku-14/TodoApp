import 'package:todo_app/Domain/Event/update_todo_event.dart';
import 'package:todo_app/Infrastructure/event_bus.dart';

import '../Infrastructure/Repository/todo_list_repository.dart';
import '../ViewModel/Dto/todo_dto.dart';

class UpdateTodoUseCase {
  late final TodoListRepository todoListRepository;

  UpdateTodoUseCase(this.todoListRepository);

  /// 更新されたTodoを更新
  void execute(TodoDto todoDto) {
    // 変更されたTodoを特定してRepositoryを更新
    //if (!todoListRepository.save(todoDto)) return;

    // 更新処理が正常に完了したらDomainEvent通知
    eventBus.fire(UpdateTodoEvent());
  }
}
