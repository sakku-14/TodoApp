import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'main_view_model_state.dart';

part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  static List<String> sortComboBoxValues = ['登録日時', '緊急度×重要度'];

  @override
  MainViewModelState build() {
    return MainViewModelState();
  }

  /// 選択されたコンボボックスの値を更新する
  void updateSelectedValue(String selectedValue) {
    state = state.copyWith(sortComboBoxValue: selectedValue);
  }
}
