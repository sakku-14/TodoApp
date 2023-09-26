// Mocks generated by Mockito 5.4.2 from annotations
// in todo_app/test/Model/TodoList/todo_list_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_app/Infrastructure/Repository/todo_list_repository.dart'
    as _i2;
import 'package:todo_app/Infrastructure/Service/db_service.dart' as _i3;
import 'package:todo_app/Model/Entities/Todo/todo.dart' as _i5;

import 'todo_list_test.dart' as _i6;

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

/// A class which mocks [TodoListRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoListRepository extends _i1.Mock
    implements _i2.TodoListRepository {
  MockTodoListRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set dbService(_i3.DbService? _dbService) => super.noSuchMethod(
        Invocation.setter(
          #dbService,
          _dbService,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<bool> save(_i5.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #save,
          [todo],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<List<_i5.Todo>> getTodoList() => (super.noSuchMethod(
        Invocation.method(
          #getTodoList,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Todo>>.value(<_i5.Todo>[]),
      ) as _i4.Future<List<_i5.Todo>>);

  @override
  _i4.Future<bool> update(_i5.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [todo],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> delete(_i5.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [todo],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [ChangeListener].
///
/// See the documentation for Mockito's code generation for more information.
class MockChangeListener<T> extends _i1.Mock implements _i6.ChangeListener<T> {
  MockChangeListener() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void call(
    T? previous,
    T? next,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #call,
          [
            previous,
            next,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
