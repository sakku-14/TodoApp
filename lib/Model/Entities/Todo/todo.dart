import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  factory Todo({
    required DateTime createAt,
    required String title,
    required int emergencyPoint,
    required int priorityPoint,
    required TabTitle status,
  }) = _Todo;
  Todo._();

  bool equal(Todo other) =>
      createAt == other.createAt &&
      title == other.title &&
      emergencyPoint == other.emergencyPoint &&
      priorityPoint == other.priorityPoint &&
      status == other.status;
}
