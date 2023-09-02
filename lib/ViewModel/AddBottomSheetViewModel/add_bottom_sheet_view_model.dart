import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/UseCase/AddTodoUseCase/add_todo_use_case.dart';
import 'package:todo_app/Infrastructure/event_bus.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';
import 'package:todo_app/ViewModel/Event/changed_common_bottom_sheet_input_info_event.dart';

import 'add_bottom_sheet_view_model_state.dart';

part 'add_bottom_sheet_view_model.g.dart';

@riverpod
class AddBottomSheetViewModel extends _$AddBottomSheetViewModel {
  late AddTodoUseCase _addTodoUseCase;

  @override
  AddBottomSheetViewModelState build() {
    _addTodoUseCase = ref.watch(addTodoUseCaseProvider);
    // TODO:23.8.31:A.Uehara:Buildメソッドが複数呼ばれる可能性があり、多重購読になるから違う購読方法を知りたい
    eventBus
        .on<ChangedCommonBottomSheetInputInfoEvent>()
        .listen((event) => judgeAddAble(event.todoDto));
    return const AddBottomSheetViewModelState();
  }

  /// 登録可否を判定し、登録可能グラグを更新する
  void judgeAddAble(TodoDto todoDto) {
    if (todoDto.title.isNotEmpty) {
      // nullではない場合のみフラグをTrueに変える
      state = state.copyWith(isAdd: true);
      return;
    }
    state = state.copyWith(isAdd: false);
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
