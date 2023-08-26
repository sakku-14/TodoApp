import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'sort_combo_box_view_model_state.dart';

part 'sort_combo_box_view_model.g.dart';

@riverpod
class SortComboBoxViewModel extends _$SortComboBoxViewModel {
  static List<String> sortComboBoxValues = ['登録日時', '緊急度×重要度'];

  @override
  SortComboBoxViewModelState build() {
    return const SortComboBoxViewModelState();
  }

  /// 選択されたコンボボックスの値を更新する
  void updateSelectedValue(String selectedValue) {
    // TODO:23.8.26:A.Uehara:コンボボックス用ViewModelに処理を移す予定
    state = state.copyWith(sortComboBoxValue: selectedValue);
  }
}
