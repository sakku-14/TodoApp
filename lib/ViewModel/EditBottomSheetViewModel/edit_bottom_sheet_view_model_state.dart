import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_bottom_sheet_view_model_state.freezed.dart';

@freezed
abstract class EditBottomSheetViewModelState
    with _$EditBottomSheetViewModelState {
  const factory EditBottomSheetViewModelState({
    @Default(true) bool isEditable,
  }) = _EditBottomSheetViewModelState;
}
