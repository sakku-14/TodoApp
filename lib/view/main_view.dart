import 'package:flutter/material.dart';
import 'package:todo_app/view/view.dart';

// widgetテスト用Key
var todoTabControllerViewKey = UniqueKey();

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoアプリ'),
      ),
      body: Column(
        children: [
          const Flexible(
            flex: 1,
            child: SortComboBoxView(),
          ),
          Flexible(
            flex: isLandscape ? 7 : 10,
            child: TodoTabControllerView(
              key: todoTabControllerViewKey,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddBottomSheetView(),
              );
            },
          );
        },
        tooltip: 'Todo追加ボタン',
        child: const Icon(Icons.add),
      ),
    );
  }
}
