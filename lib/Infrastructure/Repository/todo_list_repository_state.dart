import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_repository_state.freezed.dart';

@freezed
abstract class TodoListRepositoryState with _$TodoListRepositoryState {
  const factory TodoListRepositoryState({
    @Default('Todo Title') String title,
  }) = _TodoListRepositoryState;
}
