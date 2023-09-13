import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/Domain/Tab/tab.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    required DateTime createAt,
    required String title,
    required int emergencyPoint,
    required int priorityPoint,
    required TabState status,
  }) = _Todo;
}
