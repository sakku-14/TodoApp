import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';
import 'package:todo_app/ViewModel/Event/changed_common_bottom_sheet_input_info_event.dart';

import '../../Infrastructure/event_bus.dart';
import 'common_bottom_sheet_view_model_state.dart';

part 'common_bottom_sheet_view_model.g.dart';

@riverpod
class CommonBottomSheetViewModel extends _$CommonBottomSheetViewModel {
  @override
  CommonBottomSheetViewModelState build() {
    return const CommonBottomSheetViewModelState();
  }

  /// 更新時、登録時のボトムシートに入力された値を保持する
  void holdInputTodoInfo(TodoDto todoDto) {
    state = state.copyWith(
      title: todoDto.title,
      emergencyPoint: todoDto.emergencyPoint,
      priorityPoint: todoDto.priorityPoint,
      status: todoDto.status,
    );

    // Add/EditBottomSheetに書き換えられた値を通知する
    eventBus.fire(ChangedCommonBottomSheetInputInfoEvent(todoDto));
  }

  /// CommonBottomSheetStateを生成する
  CommonBottomSheetViewModelState initCommonBottomSheetState(TodoDto todoDto) {
    state = state.copyWith(
      title: todoDto.title,
      emergencyPoint: 2,
      priorityPoint: 2,
      status: 2,
    );
    return state;
  }
}
