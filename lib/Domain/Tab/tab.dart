import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab.g.dart';

@riverpod
TabState tab(TabRef ref) {
  return TabState.notBegin;
}

enum TabState {
  notBegin('未着手'),
  progress('作業中'),
  stay('保留'),
  complete('完了');

  const TabState(this.tabName);

  factory TabState.fromName(String name) {
    switch (name) {
      case '未着手':
        return TabState.notBegin;
      case '作業中':
        return TabState.progress;
      case '保留':
        return TabState.stay;
      case '完了':
        return TabState.complete;
    }
    return TabState.notBegin;
  }

  final String tabName;
  List<String> get tabNameList => [
        TabState.notBegin.tabName,
        TabState.progress.tabName,
        TabState.stay.tabName,
        TabState.complete.tabName
      ];
}
