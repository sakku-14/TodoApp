import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/model.dart';
import '../../use_case/use_case.dart';
import '../view.dart';

// WidgetTest用Key
var updateBottomSheetKey = UniqueKey();
var cancelButtonForUpdateBottomSheetKey = UniqueKey();
var updateButtonKey = UniqueKey();

class UpdateBottomSheetView extends ConsumerStatefulWidget {
  final DateTime createAt;
  const UpdateBottomSheetView({
    Key? key,
    required this.createAt,
  }) : super(key: key);

  @override
  ConsumerState<UpdateBottomSheetView> createState() =>
      _EditBottomSheetViewState();
}

class _EditBottomSheetViewState extends ConsumerState<UpdateBottomSheetView> {
  @override
  void initState() {
    super.initState();
    Future(() {
      Todo todo = ref.watch(todoListProvider).value!.getTodo(widget.createAt);
      ref.read(editTodoProvider.notifier).setInitialValue(todo.createAt,
          todo.title, todo.emergencyPoint, todo.priorityPoint, todo.status);
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(editTodoProvider);

    return SingleChildScrollView(
      child: Column(
        key: updateBottomSheetKey,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Todoの更新',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: TextButton(
                      key: cancelButtonForUpdateBottomSheetKey,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      onLongPress: () {},
                      child: const Text('キャンセル'),
                    ),
                  ),
                  SizedBox(
                    child: TextButton(
                      key: updateButtonKey,
                      onPressed: ref.watch(editTodoProvider
                              .select((value) => value.canSubmit))
                          ? () {
                              // Todo更新処理呼び出し
                              ref
                                  .watch(updateTodoUseCaseProvider)
                                  .execute(TodoDto(
                                    state.title,
                                    state.emergencyPoint,
                                    state.primaryPoint,
                                    state.tabStatus,
                                    createAt: state.createAt,
                                  ));
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: const Text('更新'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const CommonBottomSheetView(),
        ],
      ),
    );
  }
}
