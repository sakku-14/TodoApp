import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_bottom_sheet_view_model.g.dart';

@riverpod
class AddBottomSheetViewModel extends _$AddBottomSheetViewModel {
  @override
  AddBottomSheetViewModel build() {
    return AddBottomSheetViewModel();
  }

  /// Todoを登録する処理を呼び出す
  void addTodo(BuildContext context, String todoTitle, int emergencyPoint,
      int priorityPoint, int todoState) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            '【登録】タイトル：$todoTitle、緊急度：$emergencyPoint、重要度：$priorityPoint、ステータス：$todoState')));
  }
}
