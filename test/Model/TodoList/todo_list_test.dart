import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/Entities/Todo/todo.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';

import 'todo_list_test.mocks.dart';

abstract class ChangeListener<T> {
  void call(T? previous, T next);
}

@GenerateMocks([
  TodoListRepository,
  ChangeListener,
])
void main() {
  // region フィールド
  final MockTodoListRepository todoListRepository = MockTodoListRepository();
  final listener = MockChangeListener<AsyncValue<TodoListState>>();
  // endregion

  // region 定数
  final todo1 = Todo(
      createAt: DateTime(1),
      title: 'title',
      emergencyPoint: 1,
      priorityPoint: 1,
      status: TabTitle.notBegin);
  final todo2 = Todo(
      createAt: DateTime(2),
      title: 'title',
      emergencyPoint: 1,
      priorityPoint: 1,
      status: TabTitle.notBegin);
  final todo3 = Todo(
      createAt: DateTime(3),
      title: 'title',
      emergencyPoint: 1,
      priorityPoint: 1,
      status: TabTitle.notBegin);
  // endregion

  setUp(() {
    reset(todoListRepository);
    reset(listener);
  });

  /// テスト用ProviderContainerファクトリ
  ProviderContainer providerContainerFactory(
      MockTodoListRepository todoListRepository) {
    final container = ProviderContainer(
      overrides: [
        todoListRepositoryProvider.overrideWithValue(todoListRepository),
      ],
    );

    // 各テスト終了後にProviderContainerを破棄する
    addTearDown(container.dispose);

    // 指定したProviderをListenし、Stateが変更されるたびにlistenerを呼び出す
    // fireImmediately:trueにすることで、
    // RiverpodへStateが最新の値でlistenerを即座に呼び出せる
    container.listen(
      todoListProvider,
      listener,
      fireImmediately: true,
    );
    return container;
  }

  test('TodoListProviderを初期化できること', () async {
    // given
    when(todoListRepository.getTodoList())
        .thenAnswer((_) async => [todo1, todo2, todo3]);

    final container = providerContainerFactory(todoListRepository);
    final notifier = container.read(todoListProvider.notifier);
    final expected = [todo1, todo2, todo3];

    // when
    await notifier.future;

    // then
    // 順にStateが変化していること
    verifyInOrder([
      // Loadingの状態に変わる時
      listener.call(
        argThat(isNull),
        argThat(isA<AsyncLoading>()),
      ),
      // LoadingからStateが初期値に更新された時
      listener.call(
        argThat(isA<AsyncLoading>()),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: expected))),
      ),
    ]);

    verify(todoListRepository.getTodoList()).called(1);
  });

  test('Todoを登録できること', () async {
    // given
    final defaultTodoList = [todo1, todo2];
    when(todoListRepository.getTodoList())
        .thenAnswer((_) async => defaultTodoList);
    when(todoListRepository.save(todo3)).thenAnswer((_) async => true);

    final container = providerContainerFactory(todoListRepository);
    final notifier = container.read(todoListProvider.notifier);
    final expected = [todo1, todo2, todo3];

    // when
    notifier.addTodo(todo3);
    await notifier.future;

    // then
    verifyInOrder([
      // Loadingの状態に変わる時
      listener.call(
        argThat(isNull),
        argThat(isA<AsyncLoading>()),
      ),
      // LoadingからStateが初期値に更新された時
      listener.call(
        argThat(isA<AsyncLoading>()),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: defaultTodoList))),
      ),
      // Stateが初期値からaddTodo()呼ばれた後の値に更新された時
      listener.call(
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: defaultTodoList))),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'addTodo()',
            TodoListState(todoList: expected))),
      ),
    ]);
    verify(todoListRepository.getTodoList()).called(1);
    verify(todoListRepository.save(todo3)).called(1);
  });

  test('リポジトリが保存に失敗したら、Todoを登録できない', () async {
    // given
    final defaultTodoList = [todo1, todo2];
    when(todoListRepository.getTodoList())
        .thenAnswer((_) async => defaultTodoList);
    when(todoListRepository.save(todo3)).thenAnswer((_) async => false);

    final container = providerContainerFactory(todoListRepository);
    final notifier = container.read(todoListProvider.notifier);

    // when
    notifier.addTodo(todo3);
    await notifier.future;

    // then
    verifyInOrder([
      // Loadingの状態に変わる時
      listener.call(
        argThat(isNull),
        argThat(isA<AsyncLoading>()),
      ),
      // LoadingからStateが初期値に更新された時
      listener.call(
        argThat(isA<AsyncLoading>()),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: defaultTodoList))),
      ),
    ]);
    verify(todoListRepository.getTodoList()).called(1);
    verify(todoListRepository.save(todo3)).called(1);
  });

  test('特定のTodoを更新できること', () async {
    // given
    final defaultTodoList = [todo1, todo2];
    final newTodo2 = Todo(
        createAt: todo2.createAt,
        title: 'title',
        emergencyPoint: 2,
        priorityPoint: 2,
        status: TabTitle.progress);
    when(todoListRepository.getTodoList())
        .thenAnswer((_) async => defaultTodoList);
    when(todoListRepository.update(newTodo2)).thenAnswer((_) async => true);

    final container = providerContainerFactory(todoListRepository);
    final notifier = container.read(todoListProvider.notifier);
    final expected = [todo1, newTodo2];

    // when
    notifier.updateTodo(newTodo2);
    await notifier.future;

    // then
    verifyInOrder([
      // Loadingの状態に変わる時
      listener.call(
        argThat(isNull),
        argThat(isA<AsyncLoading>()),
      ),
      // LoadingからStateが初期値に更新された時
      listener.call(
        argThat(isA<AsyncLoading>()),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: defaultTodoList))),
      ),
      // Stateが初期値からaddTodo()呼ばれた後の値に更新された時
      listener.call(
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: defaultTodoList))),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'addTodo()',
            TodoListState(todoList: expected))),
      ),
    ]);
    verify(todoListRepository.getTodoList()).called(1);
    verify(todoListRepository.update(newTodo2)).called(1);
  });

  test('リポジトリが更新に失敗したら、特定のTodoを更新できないこと', () async {
    // given
    final defaultTodoList = [todo1, todo2];
    final newTodo2 = Todo(
        createAt: todo2.createAt,
        title: 'title',
        emergencyPoint: 2,
        priorityPoint: 2,
        status: TabTitle.progress);
    when(todoListRepository.getTodoList())
        .thenAnswer((_) async => defaultTodoList);
    when(todoListRepository.update(newTodo2)).thenAnswer((_) async => false);

    final container = providerContainerFactory(todoListRepository);
    final notifier = container.read(todoListProvider.notifier);

    // when
    notifier.updateTodo(newTodo2);
    await notifier.future;

    // then
    verifyInOrder([
      // Loadingの状態に変わる時
      listener.call(
        argThat(isNull),
        argThat(isA<AsyncLoading>()),
      ),
      // LoadingからStateが初期値に更新された時
      listener.call(
        argThat(isA<AsyncLoading>()),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: defaultTodoList))),
      ),
    ]);
    verify(todoListRepository.getTodoList()).called(1);
    verify(todoListRepository.update(newTodo2)).called(1);
  });

  test('特定のTodoを削除できること', () async {
    // given
    final defaultTodoList = [todo1, todo2, todo3];
    when(todoListRepository.getTodoList())
        .thenAnswer((_) async => defaultTodoList);
    when(todoListRepository.delete(todo2)).thenAnswer((_) async => true);

    final container = providerContainerFactory(todoListRepository);
    final notifier = container.read(todoListProvider.notifier);
    final expected = [todo1, todo3];

    // when
    notifier.deleteTodo(todo2);
    await notifier.future;

    // then
    verifyInOrder([
      // Loadingの状態に変わる時
      listener.call(
        argThat(isNull),
        argThat(isA<AsyncLoading>()),
      ),
      // LoadingからStateが初期値に更新された時
      listener.call(
        argThat(isA<AsyncLoading>()),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: defaultTodoList))),
      ),
      // Stateが初期値からaddTodo()呼ばれた後の値に更新された時
      listener.call(
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: defaultTodoList))),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'addTodo()',
            TodoListState(todoList: expected))),
      ),
    ]);
    verify(todoListRepository.getTodoList()).called(1);
    verify(todoListRepository.delete(todo2)).called(1);
  });

  test('リポジトリが削除に失敗したら、特定のTodoを削除できないこと', () async {
    // given
    final defaultTodoList = [todo1, todo2, todo3];
    when(todoListRepository.getTodoList())
        .thenAnswer((_) async => defaultTodoList);
    when(todoListRepository.delete(todo2)).thenAnswer((_) async => false);

    final container = providerContainerFactory(todoListRepository);
    final notifier = container.read(todoListProvider.notifier);

    // when
    notifier.deleteTodo(todo2);
    await notifier.future;

    // then
    verifyInOrder([
      // Loadingの状態に変わる時
      listener.call(
        argThat(isNull),
        argThat(isA<AsyncLoading>()),
      ),
      // LoadingからStateが初期値に更新された時
      listener.call(
        argThat(isA<AsyncLoading>()),
        argThat(isA<AsyncData>().having((ad) => ad.requireValue, 'build()',
            TodoListState(todoList: defaultTodoList))),
      ),
    ]);
    verify(todoListRepository.getTodoList()).called(1);
    verify(todoListRepository.delete(todo2)).called(1);
  });
}
