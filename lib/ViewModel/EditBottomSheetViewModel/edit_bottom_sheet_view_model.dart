import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/UseCase/update_todo_use_case.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

import '../../Infrastructure/Repository/todo_list_repository.dart';
import '../../Infrastructure/event_bus.dart';
import '../Event/changed_common_bottom_sheet_input_info_event.dart';
import 'edit_bottom_sheet_view_model_state.dart';

part 'edit_bottom_sheet_view_model.g.dart';

@riverpod
class EditBottomSheetViewModel extends _$EditBottomSheetViewModel {
  late final UpdateTodoUseCase _updateTodoUseCase =
      UpdateTodoUseCase(TodoListRepository());

  @override
  EditBottomSheetViewModelState build() {
    // TODO:23.8.31:A.Uehara:Buildメソッドが複数呼ばれる可能性があり、多重購読になるから違う購読方法を知りたい
    eventBus
        .on<ChangedCommonBottomSheetInputInfoEvent>()
        .listen((event) => judgeEditAble(event.todoDto));
    return const EditBottomSheetViewModelState();
  }

  /// 登録可否を判定し、登録可能グラグを更新する
  void judgeEditAble(TodoDto todoDto) {
    if (todoDto.title.isNotEmpty) {
      // nullではない場合のみフラグをTrueに変える
      state = state.copyWith(isEditable: true);
      return;
    }
    state = state.copyWith(isEditable: false);
  }

  /// Todoを更新する処理を呼び出す
  void updateTodo(TodoDto todoDto) {
    _updateTodoUseCase.execute(todoDto);
  }
}
