import '../../model/model.dart';

class TodoDto {
  final DateTime? createAt;
  final String title;
  final int emergencyPoint;
  final int priorityPoint;
  final TodoStatus status;

  TodoDto(this.title, this.emergencyPoint, this.priorityPoint, this.status,
      {this.createAt});
}
