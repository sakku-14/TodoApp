import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'common_bottom_sheet_view_model_state.dart';

part 'common_bottom_sheet_view_model.g.dart';

TextEditingController textField = TextEditingController();

@riverpod
class CommonBottomSheetViewModel extends _$CommonBottomSheetViewModel {
  @override
  CommonBottomSheetViewModelState build() {
    return const CommonBottomSheetViewModelState();
  }

  /// 更新時、登録時のボトムシートに入力された値を保持する
  // void holdInputTodoInfo(TodoDto todoDto) {
  //   state = state.copyWith(
  //     title: todoDto.title,
  //     emergencyPoint: todoDto.emergencyPoint,
  //     priorityPoint: todoDto.priorityPoint,
  //     status: todoDto.status,
  //   );
  //
  //   // Add/EditBottomSheetに書き換えられた値を通知する
  //   // eventBus.fire(ChangedCommonBottomSheetInputInfoEvent(todoDto));
  // }

  /// CommonBottomSheetStateを生成する
  // Future<void> initCommonBottomSheetState(TodoDto todoDto) async {
  //   state = state.copyWith(
  //     createAt: todoDto.createAt,
  //     title: todoDto.title,
  //     emergencyPoint: todoDto.emergencyPoint,
  //     priorityPoint: todoDto.priorityPoint,
  //     status: todoDto.status,
  //   );
  //
  //   textField = TextEditingController(text: todoDto.title);
  // }
}
