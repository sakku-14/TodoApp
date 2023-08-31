import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Infrastructure/event_bus.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';
import 'package:todo_app/ViewModel/Event/changed_common_bottom_sheet_input_info_event.dart';

import 'add_bottom_sheet_view_model_state.dart';

part 'add_bottom_sheet_view_model.g.dart';

@riverpod
class AddBottomSheetViewModel extends _$AddBottomSheetViewModel {
  @override
  AddBottomSheetViewModelState build() {
    // TODO:23.8.31:A.Uehara:Buildメソッドが複数呼ばれる可能性があり、多重購読になるから違う購読方法を知りたい
    eventBus
        .on<ChangedCommonBottomSheetInputInfoEvent>()
        .listen((event) => judgeAddAble(event.todoDto));
    return const AddBottomSheetViewModelState();
  }

  /// 登録可否を判定し、登録可能グラグを更新する
  void judgeAddAble(TodoDto todoDto) {
    // イベント引数のタイトル、各ポイントがNullかどうか判定
    if (todoDto.title.isNotEmpty) {
      // nullではない場合はフラグをTrueに変える
      state = state.copyWith(isAdd: true);
    }
  }

  /// Todoを登録する処理を呼び出す
  void addTodo(BuildContext context, TodoDto todoDto) {
    // Todo登録処理呼び出し
  }
}
