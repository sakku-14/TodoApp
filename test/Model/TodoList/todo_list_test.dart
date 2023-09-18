import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';

import '../../DummyProvider/dummy_todo_list.dart';

void main() {
  test('Todoを登録できること', () {
    // given
    final container = ProviderContainer();

    // when
    var todoListState = container.read(todoListProvider);
    final todoListNotifier = container.read(todoListProvider.notifier);

    // then
    var createTargetTodo = Todo(
        createAt: DateTime(1, 2, 3, 4),
        title: 'title',
        emergencyPoint: 1,
        priorityPoint: 1,
        status: TabTitle.notBegin);

    var result = todoListNotifier.add(createTargetTodo);
    todoListState = container.read(todoListProvider);

    // DummyTodoListに削除したTodoが存在しないことを確認する
    expect(result, true);
    expect(todoListState.todoList.contains(createTargetTodo), true);
  });

  test('特定のTodoを更新できること', () {
    // given
    final container = ProviderContainer(
      overrides: [
        todoListProvider.overrideWith(() => DummyTodoList()),
      ],
    );

    // when
    var todoListState = container.read(todoListProvider);
    final todoListNotifier = container.read(todoListProvider.notifier);

    // then
    // DummyTodoListから更新対象を取得して、それを更新処理で更新する
    var updateTargetTodo = todoListState.getNotBeginTodoList()[0];
    var updatedTargetTodo = Todo(
      createAt: updateTargetTodo.createAt,
      title: '単体テスト用更新後タイトル',
      emergencyPoint: 3,
      priorityPoint: 3,
      status: TabTitle.stay,
    );
    var result = todoListNotifier.update(updatedTargetTodo);
    todoListState = container.read(todoListProvider);

    // DummyTodoListに削除したTodoが存在しないことを確認する
    expect(result, true);
    expect(todoListState.todoList.contains(updatedTargetTodo), true);
  });

  test('特定のTodoを削除できること', () {
    // given
    final container = ProviderContainer(
      overrides: [
        todoListProvider.overrideWith(() => DummyTodoList()),
      ],
    );

    // when
    var todoListState = container.read(todoListProvider);
    final todoListNotifier = container.read(todoListProvider.notifier);

    // then
    // DummyTodoListから削除対象を取得して、それを削除処理で削除する
    var deleteTargetTodo = todoListState.getNotBeginTodoList()[0];
    var result = todoListNotifier.delete(deleteTargetTodo);
    todoListState = container.read(todoListProvider);

    // DummyTodoListに削除したTodoが存在しないことを確認する
    expect(result, true);
    expect(!todoListState.todoList.contains(deleteTargetTodo), true);
  });
}
