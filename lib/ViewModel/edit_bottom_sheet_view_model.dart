import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/UseCase/update_todo_use_case.dart';

import 'edit_bottom_sheet_view_model_state.dart';

part 'edit_bottom_sheet_view_model.g.dart';

@riverpod
class EditBottomSheetViewModel extends _$EditBottomSheetViewModel {
  late UpdateTodoUseCase _updateTodoUseCase;
  @override
  EditBottomSheetViewModelState build() {
    _updateTodoUseCase = ref.watch(updateTodoUseCaseProvider);
    return const EditBottomSheetViewModelState();
  }

  /// Todoを更新
  void updateTodo(String title) {
    _updateTodoUseCase.execute(title);
  }
}
