import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/model.dart';
import '../../use_case/use_case.dart';
import '../view.dart';

// WidgetTest用Key
var addBottomSheetKey = UniqueKey();
var cancelButtonForAddBottomSheetKey = UniqueKey();
var addButtonKey = UniqueKey();

class AddBottomSheetView extends ConsumerWidget {
  const AddBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(editTodoProvider);
    return SingleChildScrollView(
      child: Column(
        key: addBottomSheetKey,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Todoの登録',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: TextButton(
                      key: cancelButtonForAddBottomSheetKey,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      onLongPress: () {},
                      child: const Text('キャンセル'),
                    ),
                  ),
                  SizedBox(
                    child: TextButton(
                      key: addButtonKey,
                      onPressed: ref.watch(editTodoProvider
                              .select((value) => value.canSubmit))
                          ? () {
                              // Todo登録処理呼び出し
                              var result = ref
                                  .read(addTodoUseCaseProvider)
                                  .execute(TodoDto(
                                      state.title,
                                      state.emergencyPoint,
                                      state.primaryPoint,
                                      state.tabStatus));
                              if (!result) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Filed Add Todo'),
                                  ),
                                );
                              }
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: const Text('登録'),
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
