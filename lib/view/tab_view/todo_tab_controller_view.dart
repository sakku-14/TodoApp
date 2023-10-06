import 'package:flutter/material.dart';
import 'package:todo_app/view/tab_view/drag_target_tab_view.dart';

import '../../model/model.dart';
import '../view.dart';

var todoTabContentsViewKey = UniqueKey();

class TodoTabControllerView extends StatelessWidget {
  const TodoTabControllerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 4, // タブの数
      child: Column(
        children: [
          const Flexible(
            flex: 2,
            child: TabBar(
              tabs: <Widget>[
                DragTargetTabView(TodoStatus.notBegin),
                DragTargetTabView(TodoStatus.progress),
                DragTargetTabView(TodoStatus.stay),
                DragTargetTabView(TodoStatus.complete),
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
