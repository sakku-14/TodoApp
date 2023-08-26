import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/UseCase/add_todo_use_case.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

import '../../Infrastructure/Repository/todo_list_repository.dart';

part 'add_bottom_sheet_view_model.g.dart';

@riverpod
class AddBottomSheetViewModel extends _$AddBottomSheetViewModel {
  late final AddTodoUseCase _addTodoUseCase =
      AddTodoUseCase(TodoListRepository());

  @override
  AddBottomSheetViewModel build() {
    return AddBottomSheetViewModel();
  }

  /// Todoを登録する処理を呼び出す
  void addTodo(TodoDto todoDto) {
    // Todo登録処理呼び出し
    _addTodoUseCase.execute(todoDto);
  }
}
