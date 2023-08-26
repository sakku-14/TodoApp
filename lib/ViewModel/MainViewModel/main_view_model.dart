import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/Infrastructure/event_bus.dart';

import '../../Domain/Event/add_todo_event.dart';
import 'main_view_model_state.dart';

part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  @override
  MainViewModelState build() {
    // TODO:23.8.19:A.Uehara:Buildメソッドが複数回呼ばれる可能性があり、多重購読になるから違う購読方法を知りたい
    eventBus.on<AddTodoEvent>().listen((event) => addTodo(event));
    return const MainViewModelState();
  }

  /// Todoを新規追加
  void addTodo(AddTodoEvent event) {
    debugPrint(event.toString());
  }
}
