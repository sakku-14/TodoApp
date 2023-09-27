import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/model.dart';

part 'db_service.g.dart';

class DbService {
  Database? database;

  Future initDatabase() async {
    var dbFilePath = '';

    if (Platform.isAndroid) {
      dbFilePath = await getDatabasesPath();
    } else if (Platform.isIOS) {
      final dbDirectory = await getLibraryDirectory();
      dbFilePath = dbDirectory.path;
    }

    dbFilePath = join(dbFilePath, 'todo_database.db');
    if (kDebugMode) {
      print('sqLiteFilePath:$dbFilePath');
    }

    database = await openDatabase(
      dbFilePath,
      onCreate: (db, version) {
        return db.execute('''CREATE TABLE todo(
          created_at TEXT PRIMARY KEY, 
          title TEXT, 
          emergency_point INTEGER, 
          priority_point INTEGER, 
          status TEXT)''');
      },
      version: 1,
    );
  }

  Future<List<Todo>> getTodoList() async {
    if (database == null) await initDatabase();
    final List<Map<String, dynamic>> maps = await database!.query('todo');
    return List.generate(maps.length, (i) {
      return Todo.fromJson(maps[i]);
    });
  }

  Future<bool> saveTodo(Todo todo) async {
    if (database == null) await initDatabase();
    var ret = await database!.insert('todo', todo.toMap());
    return ret <= 0 ? false : true;
  }

  Future<bool> updateTodo(Todo todo) async {
    if (database == null) await initDatabase();
    var ret = await database!.update(
      'todo',
      todo.toMap(),
      where: "created_at = ?",
      whereArgs: [todo.createAt.toUtc().toIso8601String()],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );

    return ret <= 0 ? false : true;
  }

  Future<bool> deleteTodo(DateTime createAt) async {
    if (database == null) await initDatabase();
    var ret = await database!.delete(
      'todo',
      where: "created_at = ?",
      whereArgs: [createAt.toUtc().toIso8601String()],
    );

    return ret <= 0 ? false : true;
  }
}

@riverpod
DbService dbService(DbServiceRef ref) {
  return DbService();
}