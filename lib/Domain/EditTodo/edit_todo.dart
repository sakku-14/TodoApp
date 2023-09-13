import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Domain/Tab/tab.dart';

part 'edit_todo.freezed.dart';
part 'edit_todo.g.dart';

@riverpod
class EditTodo extends _$EditTodo {
  @override
  EditTodoState build() {
    return EditTodoState();
  }

  void setTitle(String title) => state.copyWith(title: title);
  void setEmergencyPoint(int point) => state.copyWith(emergencyPoint: point);
  void setPrimaryPoint(int point) => state.copyWith(primaryPoint: point);
  void setTabStatus(TabState tabState) => state.copyWith(tabStatus: tabState);
}

@freezed
abstract class EditTodoState with _$EditTodoState {
  factory EditTodoState({
    @Default('') String title,
    @Default(1) int emergencyPoint,
    @Default(1) int primaryPoint,
    @Default(TabState.notBegin) TabState tabStatus,
  }) = _EditTodoState;
  EditTodoState._();

  bool canSubmit() => title.toString().isNotEmpty;
}
