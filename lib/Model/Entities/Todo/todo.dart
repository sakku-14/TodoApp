import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';

part 'todo.freezed.dart';
// part 'todo.g.dart';

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

  Map<String, dynamic> toMap() => {
        'created_at': createAt.toUtc().toIso8601String(),
        'title': title,
        'emergency_point': emergencyPoint,
        'priority_point': priorityPoint,
        'status': status.tabName,
      };

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      createAt: DateTime.parse(json['created_at']).toLocal(),
      title: json['title'],
      emergencyPoint: json['emergency_point'] as int,
      priorityPoint: json['priority_point'] as int,
      status: TabTitle.fromName(json['status']),
    );
  }
}
