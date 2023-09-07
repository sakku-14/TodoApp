import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';
import 'package:todo_app/ViewModel/Event/changed_common_bottom_sheet_input_info_event.dart';
import 'package:todo_app/ViewModel/Event/edit_ready_event.dart';

import '../../Infrastructure/event_bus.dart';
import 'common_bottom_sheet_view_model_state.dart';

part 'common_bottom_sheet_view_model.g.dart';

@riverpod
class CommonBottomSheetViewModel extends _$CommonBottomSheetViewModel {
  TextEditingController controller = TextEditingController();

  @override
  CommonBottomSheetViewModelState build() {
    eventBus
        .on<EditReadyEvent>()
        .listen((event) => holdInputTodoInfo(event.todoDto));
    ref.keepAlive();
    return const CommonBottomSheetViewModelState();
  }

  /// 更新時、登録時のボトムシートに入力された値を保持する
  void holdInputTodoInfo(TodoDto todoDto) {
    print('holdInputTodoInfo_begin:${todoDto.toString()}');
    state = state.copyWith(
      title: todoDto.title,
      emergencyPoint: todoDto.emergencyPoint,
      priorityPoint: todoDto.priorityPoint,
      status: todoDto.status,
    );
    controller = TextEditingController(text: todoDto.title);
    print('holdInputTodoInfo_update_state:${todoDto.toString()}');

    // Add/EditBottomSheetに書き換えられた値を通知する
    eventBus.fire(ChangedCommonBottomSheetInputInfoEvent(todoDto));
    print('holdInputTodoInfo_publish_event:${todoDto.toString()}');
  }

  void setTitle() {
    state = state.copyWith(title: controller.text);

    eventBus.fire(ChangedCommonBottomSheetInputInfoEvent(TodoDto(
        state.title, state.emergencyPoint, state.priorityPoint, state.status)));
  }

  void setEmergencyPoint(int point) {
    state = state.copyWith(emergencyPoint: point);

    eventBus.fire(ChangedCommonBottomSheetInputInfoEvent(TodoDto(
        state.title, state.emergencyPoint, state.priorityPoint, state.status)));
  }

  void setPriorityPoint(int point) {
    state = state.copyWith(priorityPoint: point);

    eventBus.fire(ChangedCommonBottomSheetInputInfoEvent(TodoDto(
        state.title, state.emergencyPoint, state.priorityPoint, state.status)));
  }

  void setStatus(int statusNumber) {
    state = state.copyWith(status: statusNumber);

    eventBus.fire(ChangedCommonBottomSheetInputInfoEvent(TodoDto(
        state.title, state.emergencyPoint, state.priorityPoint, state.status)));
  }
}
