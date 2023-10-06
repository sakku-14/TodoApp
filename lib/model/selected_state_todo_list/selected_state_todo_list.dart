import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';

part 'selected_state_todo_list.g.dart';

@Riverpod(dependencies: [
  SortType,
  TodoList,
])
List<Todo> selectedStateTodoList(
    SelectedStateTodoListRef ref, TodoStatus tabTitle) {
  final sortState = ref.watch(sortTypeProvider);
  late Function sortRule;
  switch (sortState) {
    case SortState.createdAt:
      sortRule = (Todo a, Todo b) => a.createAt.compareTo(b.createAt);
    case SortState.emergencyTimesPrimary:
      // 緊急度x重要度は評価値が同値であれば、下記順に評価する
      // ①乗算結果
      // ②緊急度
      // ③作成日時
      sortRule = (Todo a, Todo b) {
        var thisPoint = a.emergencyPoint * a.priorityPoint;
        var otherPoint = b.emergencyPoint * b.priorityPoint;
        if (thisPoint == otherPoint) {
          thisPoint = a.emergencyPoint;
          otherPoint = b.emergencyPoint;
        }
        if (thisPoint != otherPoint) return -thisPoint.compareTo(otherPoint);
        return a.createAt.compareTo(b.createAt);
      };
  }

  var selectedStateTodoList = <Todo>[];
  switch (tabTitle) {
    case TodoStatus.notBegin:
      selectedStateTodoList = ref.watch(todoListProvider
          .select((value) => value.value?.notBeginTodoList ?? []));
    case TodoStatus.progress:
      selectedStateTodoList = ref.watch(todoListProvider
          .select((value) => value.value?.progressTodoList ?? []));
    case TodoStatus.stay:
      selectedStateTodoList = ref.watch(
          todoListProvider.select((value) => value.value?.stayTodoList ?? []));
    case TodoStatus.complete:
      selectedStateTodoList = ref.watch(todoListProvider
          .select((value) => value.value?.completeTodoList ?? []));
  }
  return [...selectedStateTodoList]..sort((a, b) => sortRule(a, b));
}
