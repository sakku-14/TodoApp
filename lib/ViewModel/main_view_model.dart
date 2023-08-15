import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'main_view_model_state.dart';

part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  static List<String> sortComboBoxValues = ['登録日時', '緊急度×重要度'];

  @override
  MainViewModelState build() {
    return const MainViewModelState();
  }

  /// 選択されたコンボボックスの値を更新する
  void updateSelectedValue(String selectedValue) {
    state = state.copyWith(sortComboBoxValue: selectedValue);
  }

  void onTapAddTodoButton(BuildContext context) {
    // TODO:23.8.15:Y.Sakuma:本実装では、ここからモーダルボトムシートを表示し、UseCaseを呼び出す
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Todo追加ボタンが押下されました')));
  }
}
