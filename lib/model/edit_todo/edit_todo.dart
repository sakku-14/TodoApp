import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';

part 'edit_todo.freezed.dart';
part 'edit_todo.g.dart';

@riverpod
class EditTodo extends _$EditTodo {
  @override
  EditTodoState build() {
    return EditTodoState();
  }

  void setCreateAt(DateTime time) => state = state.copyWith(createAt: time);
  void setTitle(String title) => state = state.copyWith(title: title);
  void setEmergencyPoint(int point) =>
      state = state.copyWith(emergencyPoint: point);
  void setPrimaryPoint(int point) =>
      state = state.copyWith(primaryPoint: point);
  void setTabStatus(TodoStatus tabState) =>
      state = state.copyWith(tabStatus: tabState);
  void setInitialValue(DateTime time, String title, int emergency, int primary,
      TodoStatus tabState) {
    state = state.copyWith(
        createAt: time,
        title: title,
        textEditingController: TextEditingController(text: title),
        emergencyPoint: emergency,
        primaryPoint: primary,
        tabStatus: tabState);
  }
}

@freezed
class EditTodoState with _$EditTodoState {
  factory EditTodoState({
    DateTime? createAt,
    @Default('') String title,
    TextEditingController? textEditingController,
    @Default(1) int emergencyPoint,
    @Default(1) int primaryPoint,
    @Default(TodoStatus.notBegin) TodoStatus tabStatus,
  }) = _EditTodoState;
  EditTodoState._();

  late final canSubmit = title.toString().isNotEmpty;
}
