enum TabTitle {
  notBegin('未着手'),
  progress('作業中'),
  stay('保留'),
  complete('完了');

  const TabTitle(this.tabName);

  factory TabTitle.fromName(String name) {
    switch (name) {
      case '未着手':
        return TabTitle.notBegin;
      case '作業中':
        return TabTitle.progress;
      case '保留':
        return TabTitle.stay;
      case '完了':
        return TabTitle.complete;
    }
    return TabTitle.notBegin;
  }

  final String tabName;
  List<String> get tabNameList => [
        TabTitle.notBegin.tabName,
        TabTitle.progress.tabName,
        TabTitle.stay.tabName,
        TabTitle.complete.tabName
      ];
}
