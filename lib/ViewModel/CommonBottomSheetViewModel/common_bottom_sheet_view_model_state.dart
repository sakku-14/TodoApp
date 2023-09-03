import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_bottom_sheet_view_model_state.freezed.dart';

@freezed
abstract class CommonBottomSheetViewModelState
    with _$CommonBottomSheetViewModelState {
  const factory CommonBottomSheetViewModelState({
    @Default('') String title,
    @Default(1) int emergencyPoint,
    @Default(1) int priorityPoint,
    @Default(1) int status,
  }) = _CommonBottomSheetViewModelState;
}
