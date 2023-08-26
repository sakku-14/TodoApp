import 'package:freezed_annotation/freezed_annotation.dart';

import '../Dto/todo_dto.dart';

part 'main_view_model_state.freezed.dart';

@freezed
abstract class MainViewModelState with _$MainViewModelState {
  const factory MainViewModelState({
    required List<TodoDto> notBeginTodoDtoList,
    required List<TodoDto> progressTodoDtoList,
    required List<TodoDto> stayTodoDtoList,
    required List<TodoDto> completeTodoDtoList,
  }) = _MainViewModelState;
}
