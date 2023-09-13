import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab.g.dart';

@riverpod
Tab tab(TabRef ref) {
  return Tab.notBegin;
}

enum Tab {
  notBegin('未着手'),
  progress('作業中'),
  stay('保留'),
  complete('完了');

  const Tab(this.tabName);

  final String tabName;
  List<String> get tabNameList => [
        Tab.notBegin.tabName,
        Tab.progress.tabName,
        Tab.stay.tabName,
        Tab.complete.tabName
      ];
}
