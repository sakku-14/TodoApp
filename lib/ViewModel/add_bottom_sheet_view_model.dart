import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

part 'add_bottom_sheet_view_model.g.dart';

@riverpod
class AddBottomSheetViewModel extends _$AddBottomSheetViewModel {
  @override
  AddBottomSheetViewModel build() {
    return AddBottomSheetViewModel();
  }

  /// Todoを登録する処理を呼び出す
  void addTodo(BuildContext context, TodoDto todoDto) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('【登録】タイトル：${todoDto.title}、'
            '緊急度：${todoDto.emergencyPoint}、'
            '重要度：${todoDto.priorityPoint}、'
            'ステータス：${todoDto.status}')));
  }
}
