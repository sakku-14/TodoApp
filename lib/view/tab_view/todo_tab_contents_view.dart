import 'package:flutter/material.dart';
import 'package:todo_app/view/tab_view/todo_list_view.dart';

import '../../model/model.dart';

class TodoTabContentsView extends StatelessWidget {
  const TodoTabContentsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: <Widget>[
        // 未着手タブのコンテンツ
        TodoListView(TodoStatus.notBegin),
        // 作業中タブのコンテンツ
        TodoListView(TodoStatus.progress),
        // 保留タブのコンテンツ
        TodoListView(TodoStatus.stay),
        // 完了タブのコンテンツ
        TodoListView(TodoStatus.complete),
      ],
    );
  }
}
