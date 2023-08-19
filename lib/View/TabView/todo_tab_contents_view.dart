import 'package:flutter/material.dart';
import 'package:todo_app/View/todo_view.dart';
import 'package:todo_app/ViewModel/Dto/todo_dto.dart';

class TodoTabContentsView extends StatelessWidget {
  const TodoTabContentsView({
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

  Widget convertToTodoViewList(List<TodoDto> todoDtoList) {
    var todoContents = todoDtoList.isEmpty
        ? [Container()]
        : todoDtoList.map((e) => TodoView(todoDto: e)).toList();
    var todoViews = SingleChildScrollView(
      child: Column(
        children: todoContents,
      ),
    );
    return todoViews;
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        convertToTodoViewList(notBeginTodoDtoList), // 未着手タブのコンテンツ
        convertToTodoViewList(progressTodoDtoList), // 作業中タブのコンテンツ
        convertToTodoViewList(stayTodoDtoList), // 保留タブのコンテンツ
        convertToTodoViewList(completeTodoDtoList), // 完了タブのコンテンツ
      ],
    );
  }
}
