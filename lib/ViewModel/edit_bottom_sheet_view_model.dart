import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_bottom_sheet_view_model.g.dart';

@riverpod
class EditBottomSheetViewModel extends _$EditBottomSheetViewModel {
  @override
  EditBottomSheetViewModel build() {
    return EditBottomSheetViewModel();
  }

  /// Todoを更新する処理を呼び出す
  void updateTodo(BuildContext context, String todoTitle, int emergencyPoint,
      int priorityPoint, int todoState) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            '【更新】タイトル：$todoTitle、緊急度：$emergencyPoint、重要度：$priorityPoint、ステータス：$todoState')));
  }
}
