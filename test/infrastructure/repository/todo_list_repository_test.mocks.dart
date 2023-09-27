// Mocks generated by Mockito 5.4.2 from annotations
// in todo_app/test/infrastructure/repository/todo_list_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i3;
import 'package:todo_app/infrastructure/service/db_service.dart' as _i2;
import 'package:todo_app/model/model.dart' as _i5;

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

/// A class which mocks [DbService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDbService extends _i1.Mock implements _i2.DbService {
  MockDbService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set database(_i3.Database? _database) => super.noSuchMethod(
        Invocation.setter(
          #database,
          _database,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<dynamic> initDatabase() => (super.noSuchMethod(
        Invocation.method(
          #initDatabase,
          [],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);

  @override
  _i4.Future<List<_i5.Todo>> getTodoList() => (super.noSuchMethod(
        Invocation.method(
          #getTodoList,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Todo>>.value(<_i5.Todo>[]),
      ) as _i4.Future<List<_i5.Todo>>);

  @override
  _i4.Future<bool> saveTodo(_i5.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #saveTodo,
          [todo],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> updateTodo(_i5.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [todo],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> deleteTodo(DateTime? createAt) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodo,
          [createAt],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}