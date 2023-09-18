// Mocks generated by Mockito 5.4.2 from annotations
// in todo_app/test/UseCase/DeleteTodoUseCase/delete_todo_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:riverpod_annotation/riverpod_annotation.dart' as _i2;
import 'package:todo_app/Model/Entities/Todo/todo.dart' as _i4;
import 'package:todo_app/Model/TodoList/todo_list.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAutoDisposeNotifierProviderRef_0<T> extends _i1.SmartFake
    implements _i2.AutoDisposeNotifierProviderRef<T> {
  _FakeAutoDisposeNotifierProviderRef_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTodoListState_1 extends _i1.SmartFake implements _i3.TodoListState {
  _FakeTodoListState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoList].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoList extends _i1.Mock implements _i3.TodoList {
  MockTodoList() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AutoDisposeNotifierProviderRef<_i3.TodoListState> get ref =>
      (super.noSuchMethod(
        Invocation.getter(#ref),
        returnValue: _FakeAutoDisposeNotifierProviderRef_0<_i3.TodoListState>(
          this,
          Invocation.getter(#ref),
        ),
      ) as _i2.AutoDisposeNotifierProviderRef<_i3.TodoListState>);
  @override
  _i3.TodoListState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTodoListState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.TodoListState);
  @override
  set state(_i3.TodoListState? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.TodoListState build() => (super.noSuchMethod(
        Invocation.method(
          #build,
          [],
        ),
        returnValue: _FakeTodoListState_1(
          this,
          Invocation.method(
            #build,
            [],
          ),
        ),
      ) as _i3.TodoListState);
  @override
  bool add(_i4.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [todo],
        ),
        returnValue: false,
      ) as bool);
  @override
  bool update(_i4.Todo? newTodo) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [newTodo],
        ),
        returnValue: false,
      ) as bool);
  @override
  bool delete(_i4.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [todo],
        ),
        returnValue: false,
      ) as bool);
  @override
  bool updateShouldNotify(
    _i3.TodoListState? previous,
    _i3.TodoListState? next,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            previous,
            next,
          ],
        ),
        returnValue: false,
      ) as bool);
}
