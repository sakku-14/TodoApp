class TodoDto {
  final String title;
  final int emergencyPoint;
  final int priorityPoint;
  final int status;

  TodoDto(
    this.title,
    this.emergencyPoint,
    this.priorityPoint,
    this.status,
  );

  @override
  String toString() {
    return 'title: $title, emergencyPoint: $emergencyPoint, priorityPoint: $priorityPoint, status: $status';
  }
}
