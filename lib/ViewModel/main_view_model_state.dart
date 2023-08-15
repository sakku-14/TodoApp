import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_view_model_state.freezed.dart';

@freezed
abstract class MainViewModelState with _$MainViewModelState {
  const factory MainViewModelState({
    @Default('登録日時') String sortComboBoxValue,
  }) = _MainViewModelState;
}
