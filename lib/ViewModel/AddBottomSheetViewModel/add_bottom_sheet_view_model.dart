import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/UseCase/AddTodoUseCase/add_todo_use_case.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

import 'add_bottom_sheet_view_model_state.dart';

part 'add_bottom_sheet_view_model.g.dart';

@riverpod
class AddBottomSheetViewModel extends _$AddBottomSheetViewModel {
  late AddTodoUseCase _addTodoUseCase;

  StreamSubscription? _myEvent;

  AddBottomSheetViewModel() {
    // _myEvent = eventBus
    //     .on<ChangedCommonBottomSheetInputInfoEvent>()
    //     .listen((event) => judgeAddAble(event.todoDto));
  }

  @override
  AddBottomSheetViewModelState build() {
    _addTodoUseCase = ref.watch(addTodoUseCaseProvider);

    ref.onDispose(() {
      _myEvent?.cancel();
    });

    return const AddBottomSheetViewModelState();
  }

  /// 登録可否を判定し、登録可能グラグを更新する
  void judgeAddAble(TodoDto todoDto) {
    if (todoDto.title.isNotEmpty) {
      // nullではない場合のみフラグをTrueに変える
      state = state.copyWith(isAddable: true);
      return;
    }
    state = state.copyWith(isAddable: false);
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
