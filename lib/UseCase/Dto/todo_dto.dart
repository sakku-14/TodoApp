import 'package:todo_app/Model/Entities/Tab/tab.dart';

class TodoDto {
  final DateTime? createAt;
  final String title;
  final int emergencyPoint;
  final int priorityPoint;
  final TabTitle status;

  TodoDto(this.title, this.emergencyPoint, this.priorityPoint, this.status,
      {this.createAt});
}
