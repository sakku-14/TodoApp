import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_bottom_sheet_view_model_state.freezed.dart';

@freezed
abstract class CommonBottomSheetViewModelState
    with _$CommonBottomSheetViewModelState {
  const factory CommonBottomSheetViewModelState({
    String? title,
    int? emergencyPoint,
    int? priorityPoint,
    int? status,
  }) = _CommonBottomSheetViewModelState;
}
