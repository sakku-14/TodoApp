class TodoDto {
  final DateTime? createAt;
  final String title;
  final int emergencyPoint;
  final int priorityPoint;
  final int status;

  TodoDto(
    this.createAt,
    this.title,
    this.emergencyPoint,
    this.priorityPoint,
    this.status,
  );
}
