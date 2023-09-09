import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/UseCase/update_todo_use_case.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

import '../../Infrastructure/Repository/todo_list_repository.dart';
import 'edit_bottom_sheet_view_model_state.dart';

part 'edit_bottom_sheet_view_model.g.dart';

@riverpod
class EditBottomSheetViewModel extends _$EditBottomSheetViewModel {
  late final UpdateTodoUseCase _updateTodoUseCase =
      UpdateTodoUseCase(TodoListRepository());

  @override
  EditBottomSheetViewModelState build() {
    return const EditBottomSheetViewModelState();
  }

  /// Todoを更新する処理を呼び出す
  void onUpdateTodo(TodoDto todoDto, BuildContext context) {
    _updateTodoUseCase.execute(todoDto);

    // ボトムシートを閉じる
    Navigator.of(context).pop();
  }
}
