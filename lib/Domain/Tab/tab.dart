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

  final String tabName;
  List<String> get tabNameList => [
        TabState.notBegin.tabName,
        TabState.progress.tabName,
        TabState.stay.tabName,
        TabState.complete.tabName
      ];
}
