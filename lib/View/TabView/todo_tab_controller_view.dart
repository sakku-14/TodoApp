import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Model/Entities/Tab/tab.dart';
import 'package:todo_app/Model/TodoList/todo_list.dart';
import 'package:todo_app/UseCase/Dto/todo_dto.dart';
import 'package:todo_app/UseCase/UpdateTodoUseCase/update_todo_use_case.dart';
import 'package:todo_app/View/TabView/todo_count_view.dart';
import 'package:todo_app/View/TabView/todo_tab_contents_view.dart';

var todoTabContentsViewKey = UniqueKey();
bool isNotBeginDroppableArea = false; // 未着手タブ範囲内かどうかのフラグ
bool isProgressDroppableArea = false; // 作業中タブ範囲内かどうかのフラグ
bool isStayDroppableArea = false; // 保留タブ範囲内かどうかのフラグ
bool isCompleteDroppableArea = false; // 完了タブ範囲内かどうかのフラグ

class TodoTabControllerView extends ConsumerWidget {
  const TodoTabControllerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 4, // タブの数
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: TabBar(
              tabs: <Widget>[
                DragTarget(
                  builder: (BuildContext context, List<Object?> candidateData,
                      List<dynamic> rejectedData) {
                    return Container(
                      color: isNotBeginDroppableArea
                          ? Colors.deepPurpleAccent.withOpacity(0.5)
                          : Colors.transparent,
                      child: Tab(
                        child: Column(
                          children: [
                            Text(TabTitle.notBegin.tabName),
                            TodoCountView(
                              targetListCount: ref.watch(
                                todoListProvider.select(
                                  (value) => value.when(
                                      data: (data) =>
                                          data.getNotBeginTodoList().length,
                                      error: (err, st) => null,
                                      loading: () => null),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  // DragTarget の範囲に入った時に呼ばれる
                  onWillAccept: (data) {
                    isNotBeginDroppableArea = true;
                    return true; // ドラッグ操作を受け入れる場合はここでtrueを返す
                  },
                  // DragTargetにドラッグされた時に呼ばれる
                  onAccept: (TodoDto data) {
                    isNotBeginDroppableArea = false;
                    ref.read(updateTodoUseCaseProvider).execute(TodoDto(
                          createAt: data.createAt,
                          data.title,
                          data.emergencyPoint,
                          data.priorityPoint,
                          TabTitle.notBegin,
                        ));
                  },
                  // DragTarget の範囲から離れた時に呼ばれる
                  onLeave: (data) {
                    isNotBeginDroppableArea = false;
                  },
                ),
                DragTarget(
                  builder: (BuildContext context, List<Object?> candidateData,
                      List<dynamic> rejectedData) {
                    return Container(
                      color: isProgressDroppableArea
                          ? Colors.deepPurpleAccent.withOpacity(0.5)
                          : Colors.transparent,
                      child: Tab(
                        child: Column(
                          children: [
                            Text(TabTitle.progress.tabName),
                            TodoCountView(
                              targetListCount: ref.watch(
                                todoListProvider.select(
                                  (value) => value.when(
                                      data: (data) =>
                                          data.getProgressTodoList().length,
                                      error: (err, st) => null,
                                      loading: () => null),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  // DragTarget の範囲に入った時に呼ばれる
                  onWillAccept: (data) {
                    isProgressDroppableArea = true;
                    return true; // ドラッグ操作を受け入れる場合はここでtrueを返す
                  },
                  // DragTargetにドラッグされた時に呼ばれる
                  onAccept: (TodoDto data) {
                    isProgressDroppableArea = false;
                    ref.read(updateTodoUseCaseProvider).execute(TodoDto(
                          createAt: data.createAt,
                          data.title,
                          data.emergencyPoint,
                          data.priorityPoint,
                          TabTitle.progress,
                        ));
                  },
                  // DragTarget の範囲から離れた時に呼ばれる
                  onLeave: (data) {
                    isProgressDroppableArea = false;
                  },
                ),
                DragTarget(
                  builder: (BuildContext context, List<Object?> candidateData,
                      List<dynamic> rejectedData) {
                    return Container(
                      color: isStayDroppableArea
                          ? Colors.deepPurpleAccent.withOpacity(0.5)
                          : Colors.transparent,
                      child: Tab(
                        child: Column(
                          children: [
                            Text(TabTitle.stay.tabName),
                            TodoCountView(
                              targetListCount: ref.watch(
                                todoListProvider.select(
                                  (value) => value.when(
                                      data: (data) =>
                                          data.getStayTodoList().length,
                                      error: (err, st) => null,
                                      loading: () => null),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  // DragTarget の範囲に入った時に呼ばれる
                  onWillAccept: (data) {
                    isStayDroppableArea = true;
                    return true; // ドラッグ操作を受け入れる場合はここでtrueを返す
                  },
                  // DragTargetにドラッグされた時に呼ばれる
                  onAccept: (TodoDto data) {
                    isStayDroppableArea = false;
                    ref.read(updateTodoUseCaseProvider).execute(TodoDto(
                          createAt: data.createAt,
                          data.title,
                          data.emergencyPoint,
                          data.priorityPoint,
                          TabTitle.stay,
                        ));
                  },
                  // DragTarget の範囲から離れた時に呼ばれる
                  onLeave: (data) {
                    isStayDroppableArea = false;
                  },
                ),
                DragTarget(
                  builder: (BuildContext context, List<Object?> candidateData,
                      List<dynamic> rejectedData) {
                    return Container(
                      color: isCompleteDroppableArea
                          ? Colors.deepPurpleAccent.withOpacity(0.5)
                          : Colors.transparent,
                      child: Tab(
                        child: Column(
                          children: [
                            Text(TabTitle.complete.tabName),
                            TodoCountView(
                              targetListCount: ref.watch(
                                todoListProvider.select(
                                  (value) => value.when(
                                      data: (data) =>
                                          data.getCompleteTodoList().length,
                                      error: (err, st) => null,
                                      loading: () => null),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  // DragTarget の範囲に入った時に呼ばれる
                  onWillAccept: (data) {
                    isCompleteDroppableArea = true;
                    return true; // ドラッグ操作を受け入れる場合はここでtrueを返す
                  },
                  // DragTargetにドラッグされた時に呼ばれる
                  onAccept: (TodoDto data) {
                    isCompleteDroppableArea = false;
                    ref.read(updateTodoUseCaseProvider).execute(TodoDto(
                          createAt: data.createAt,
                          data.title,
                          data.emergencyPoint,
                          data.priorityPoint,
                          TabTitle.complete,
                        ));
                  },
                  // DragTarget の範囲から離れた時に呼ばれる
                  onLeave: (data) {
                    isCompleteDroppableArea = false;
                  },
                ),
              ],
            ),
          ),
          Flexible(
            flex: 10,
            child: TodoTabContentsView(key: todoTabContentsViewKey),
          ),
        ],
      ),
    );
  }
}
