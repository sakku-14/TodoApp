import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  const Todo._();

  const factory Todo({
    required DateTime createDateTime,
    required String title,
    required int emergencyPoint,
    required int priorityPoint,
    required int status,
  }) = _Todo;
}
