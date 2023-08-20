import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

part 'edit_bottom_sheet_view_model.g.dart';

@riverpod
class EditBottomSheetViewModel extends _$EditBottomSheetViewModel {
  @override
  EditBottomSheetViewModel build() {
    return EditBottomSheetViewModel();
  }

  /// Todoを更新する処理を呼び出す
  void updateTodo(BuildContext context, TodoDto todoDto) {
    // Todo更新処理呼び出し
  }
}
