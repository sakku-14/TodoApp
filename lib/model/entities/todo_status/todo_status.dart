enum TodoStatus {
  notBegin('未着手'),
  progress('作業中'),
  stay('保留'),
  complete('完了');

  const TodoStatus(this.statusName);

  factory TodoStatus.fromName(String name) {
    switch (name) {
      case '未着手':
        return TodoStatus.notBegin;
      case '作業中':
        return TodoStatus.progress;
      case '保留':
        return TodoStatus.stay;
      case '完了':
        return TodoStatus.complete;
    }
    return TodoStatus.notBegin;
  }

  final String statusName;
  List<String> get statusNameList => [
        TodoStatus.notBegin.statusName,
        TodoStatus.progress.statusName,
        TodoStatus.stay.statusName,
        TodoStatus.complete.statusName
      ];
}
