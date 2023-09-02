import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_bottom_sheet_view_model_state.freezed.dart';

@freezed
abstract class AddBottomSheetViewModelState
    with _$AddBottomSheetViewModelState {
  const factory AddBottomSheetViewModelState({
    @Default(false) bool isAdd,
  }) = _AddBottomSheetViewModelState;
}
