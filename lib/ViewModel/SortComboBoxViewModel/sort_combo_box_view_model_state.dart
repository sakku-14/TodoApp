import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_combo_box_view_model_state.freezed.dart';

@freezed
abstract class SortComboBoxViewModelState with _$SortComboBoxViewModelState {
  const factory SortComboBoxViewModelState({
    @Default('登録日時') String sortComboBoxValue,
  }) = _SortComboBoxViewModelState;
}
