import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/model.dart';
import '../../use_case/use_case.dart';
import '../view.dart';

part 'drag_target_tab_view.g.dart';

class DragTargetTabView extends ConsumerWidget {
  const DragTargetTabView(this.status, {super.key});

  final TodoStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final int? listCount;
    switch (status) {
      case TodoStatus.notBegin:
        listCount = ref.watch(todoListProvider
            .select((value) => value.value?.notBeginTodoList.length));
      case TodoStatus.progress:
        listCount = ref.watch(todoListProvider
            .select((value) => value.value?.progressTodoList.length));
      case TodoStatus.stay:
        listCount = ref.watch(todoListProvider
            .select((value) => value.value?.stayTodoList.length));
      case TodoStatus.complete:
        listCount = ref.watch(todoListProvider
            .select((value) => value.value?.completeTodoList.length));
    }
    return DragTarget(
      builder: (BuildContext context, List<Object?> candidateData,
          List<dynamic> rejectedData) {
        return Container(
          color: ref.watch(isDragOnProvider(status))
              ? Colors.deepPurpleAccent.withOpacity(0.5)
              : Colors.transparent,
          child: Tab(
            child: Column(
              children: [
                Text(status.statusName),
                TodoCountView(
                  targetListCount: listCount,
                ),
              ],
            ),
          ),
        );
      },
      // DragTarget の範囲に入った時に呼ばれる
      onWillAccept: (data) {
        ref.read(isDragOnProvider(status).notifier).setIsDragOn(true);
        return true; // ドラッグ操作を受け入れる場合はここでtrueを返す
      },
      // DragTargetにドロップされた時に呼ばれる
      onAccept: (TodoDto data) {
        ref.read(isDragOnProvider(status).notifier).setIsDragOn(false);
        ref.read(updateTodoUseCaseProvider).execute(TodoDto(
              createAt: data.createAt,
              data.title,
              data.emergencyPoint,
              data.priorityPoint,
              status,
            ));
      },
      // DragTarget の範囲から離れた時に呼ばれる
      onLeave: (data) {
        ref.read(isDragOnProvider(status).notifier).setIsDragOn(false);
      },
    );
  }
}

@riverpod
class IsDragOn extends _$IsDragOn {
  @override
  bool build(TodoStatus status) {
    return false;
  }

  void setIsDragOn(bool flag) => state = flag;
}
