import 'package:flutter/material.dart';
import 'package:todo_app/View/TabView/todo_tab_contents_view.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

var todoTabContentsViewKey = UniqueKey();

class TodoTabControllerView extends StatelessWidget {
  const TodoTabControllerView({
    super.key,
    required this.notBeginTodoDtoList,
    required this.progressTodoDtoList,
    required this.stayTodoDtoList,
    required this.completeTodoDtoList,
  });

  final List<TodoDto> notBeginTodoDtoList;
  final List<TodoDto> progressTodoDtoList;
  final List<TodoDto> stayTodoDtoList;
  final List<TodoDto> completeTodoDtoList;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 4, // タブの数
      child: Column(
        children: [
          const Flexible(
            flex: 1,
            child: TabBar(
              tabs: <Widget>[
                Tab(child: Text('未着手')),
                Tab(child: Text('作業中')),
                Tab(child: Text('保留')),
                Tab(child: Text('完了')),
              ],
            ),
          ),
          Flexible(
            flex: 10,
            child: TodoTabContentsView(
              key: todoTabContentsViewKey,
              notBeginTodoDtoList: notBeginTodoDtoList,
              progressTodoDtoList: progressTodoDtoList,
              stayTodoDtoList: stayTodoDtoList,
              completeTodoDtoList: completeTodoDtoList,
            ),
          ),
        ],
      ),
    );
  }
}
