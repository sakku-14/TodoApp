import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

GlobalKey tabBarKey = GlobalKey();

class TodoTabControllerView extends StatefulWidget {
  const TodoTabControllerView(
      {super.key,
      required this.parentColumnKey,
      required this.sortComboBoxKey});

  final GlobalKey parentColumnKey;
  final GlobalKey sortComboBoxKey;

  @override
  State<TodoTabControllerView> createState() => _TodoTabControllerViewState();
}

class _TodoTabControllerViewState extends State<TodoTabControllerView> {
  double parentHeight = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox? parentColumnBox = widget.parentColumnKey.currentContext
          ?.findRenderObject() as RenderBox?;
      if (parentColumnBox != null) {
        setState(() {
          parentHeight = parentColumnBox!.size.height;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var thisHeight = parentHeight * 0.9;
    if (thisHeight <= 0) thisHeight = 0;
    print('parentHeight: {$parentHeight}, thisHeight: {$thisHeight}');

    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 4, // タブの数
      child: SizedBox(
        height: thisHeight,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                key: tabBarKey,
                tabs: <Widget>[
                  Tab(child: Text('未着手')),
                  Tab(child: Text('作業中')),
                  Tab(child: Text('保留')),
                  Tab(child: Text('完了')),
                ],
              ),
            ),
            thisHeight == 0
                ? Container()
                : SizedBox(
                    width: double.infinity,
                    height: thisHeight - 50,
                    child: const TabBarView(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                            ],
                          ),
                        ),
                        Text('data3'),
                        Text('data4'),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
