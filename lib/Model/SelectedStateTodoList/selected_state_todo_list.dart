import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/SortType/sort_type.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';

part 'selected_state_todo_list.g.dart';

@Riverpod(dependencies: [
  SortType,
  TodoList,
])
List<Todo> selectedStateTodoList(
    SelectedStateTodoListRef ref, TabTitle tabTitle) {
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

  switch (tabTitle) {
    case TabTitle.notBegin:
      return ref.watch(todoListProvider).when(
          data: (data) =>
              [...data.getNotBeginTodoList()]..sort((a, b) => sortRule(a, b)),
          error: (err, st) => [],
          loading: () => []);
    case TabTitle.progress:
      return ref.watch(todoListProvider).when(
          data: (data) =>
              [...data.getProgressTodoList()]..sort((a, b) => sortRule(a, b)),
          error: (err, st) => [],
          loading: () => []);
    case TabTitle.stay:
      return ref.watch(todoListProvider).when(
          data: (data) =>
              [...data.getStayTodoList()]..sort((a, b) => sortRule(a, b)),
          error: (err, st) => [],
          loading: () => []);
    case TabTitle.complete:
      return ref.watch(todoListProvider).when(
          data: (data) =>
              [...data.getCompleteTodoList()]..sort((a, b) => sortRule(a, b)),
          error: (err, st) => [],
          loading: () => []);
  }
}
