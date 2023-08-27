import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/UseCase/AddTodoUseCase/add_todo_use_case.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

part 'add_bottom_sheet_view_model.g.dart';

@riverpod
class AddBottomSheetViewModel extends _$AddBottomSheetViewModel {
  late AddTodoUseCase _addTodoUseCase;

  @override
  AddBottomSheetViewModel build() {
    _addTodoUseCase = ref.watch(addTodoUseCaseProvider);
    return AddBottomSheetViewModel();
  }

  /// Todoを登録する処理を呼び出す
  void addTodo(TodoDto todoDto, BuildContext context) {
    // Todo登録処理呼び出し
    var result = _addTodoUseCase.execute(todoDto);
    if (!result) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Filed Add Todo'),
      ));
    }
  }
}
