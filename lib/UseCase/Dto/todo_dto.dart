import 'package:todo_app/Model/Entities/TodoStatus/todo_status.dart';

class TodoDto {
  final DateTime? createAt;
  final String title;
  final int emergencyPoint;
  final int priorityPoint;
  final TodoStatus status;

  TodoDto(this.title, this.emergencyPoint, this.priorityPoint, this.status,
      {this.createAt});
}
