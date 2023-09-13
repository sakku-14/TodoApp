import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    required DateTime createAt,
    required String title,
    required int emergencyPoint,
    required int priorityPoint,
    required int status,
  }) = _Todo;
}
