// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_bottom_sheet_view_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonBottomSheetViewModelState {
  String get title => throw _privateConstructorUsedError;
  int get emergencyPoint => throw _privateConstructorUsedError;
  int get priorityPoint => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonBottomSheetViewModelStateCopyWith<CommonBottomSheetViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonBottomSheetViewModelStateCopyWith<$Res> {
  factory $CommonBottomSheetViewModelStateCopyWith(
          CommonBottomSheetViewModelState value,
          $Res Function(CommonBottomSheetViewModelState) then) =
      _$CommonBottomSheetViewModelStateCopyWithImpl<$Res,
          CommonBottomSheetViewModelState>;
  @useResult
  $Res call({String title, int emergencyPoint, int priorityPoint, int status});
}

/// @nodoc
class _$CommonBottomSheetViewModelStateCopyWithImpl<$Res,
        $Val extends CommonBottomSheetViewModelState>
    implements $CommonBottomSheetViewModelStateCopyWith<$Res> {
  _$CommonBottomSheetViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? emergencyPoint = null,
    Object? priorityPoint = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      emergencyPoint: null == emergencyPoint
          ? _value.emergencyPoint
          : emergencyPoint // ignore: cast_nullable_to_non_nullable
              as int,
      priorityPoint: null == priorityPoint
          ? _value.priorityPoint
          : priorityPoint // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommonBottomSheetViewModelStateCopyWith<$Res>
    implements $CommonBottomSheetViewModelStateCopyWith<$Res> {
  factory _$$_CommonBottomSheetViewModelStateCopyWith(
          _$_CommonBottomSheetViewModelState value,
          $Res Function(_$_CommonBottomSheetViewModelState) then) =
      __$$_CommonBottomSheetViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int emergencyPoint, int priorityPoint, int status});
}

/// @nodoc
class __$$_CommonBottomSheetViewModelStateCopyWithImpl<$Res>
    extends _$CommonBottomSheetViewModelStateCopyWithImpl<$Res,
        _$_CommonBottomSheetViewModelState>
    implements _$$_CommonBottomSheetViewModelStateCopyWith<$Res> {
  __$$_CommonBottomSheetViewModelStateCopyWithImpl(
      _$_CommonBottomSheetViewModelState _value,
      $Res Function(_$_CommonBottomSheetViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? emergencyPoint = null,
    Object? priorityPoint = null,
    Object? status = null,
  }) {
    return _then(_$_CommonBottomSheetViewModelState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      emergencyPoint: null == emergencyPoint
          ? _value.emergencyPoint
          : emergencyPoint // ignore: cast_nullable_to_non_nullable
              as int,
      priorityPoint: null == priorityPoint
          ? _value.priorityPoint
          : priorityPoint // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CommonBottomSheetViewModelState
    implements _CommonBottomSheetViewModelState {
  const _$_CommonBottomSheetViewModelState(
      {this.title = "",
      this.emergencyPoint = 1,
      this.priorityPoint = 1,
      this.status = 1});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int emergencyPoint;
  @override
  @JsonKey()
  final int priorityPoint;
  @override
  @JsonKey()
  final int status;

  @override
  String toString() {
    return 'CommonBottomSheetViewModelState(title: $title, emergencyPoint: $emergencyPoint, priorityPoint: $priorityPoint, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonBottomSheetViewModelState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.emergencyPoint, emergencyPoint) ||
                other.emergencyPoint == emergencyPoint) &&
            (identical(other.priorityPoint, priorityPoint) ||
                other.priorityPoint == priorityPoint) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, emergencyPoint, priorityPoint, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommonBottomSheetViewModelStateCopyWith<
          _$_CommonBottomSheetViewModelState>
      get copyWith => __$$_CommonBottomSheetViewModelStateCopyWithImpl<
          _$_CommonBottomSheetViewModelState>(this, _$identity);
}

abstract class _CommonBottomSheetViewModelState
    implements CommonBottomSheetViewModelState {
  const factory _CommonBottomSheetViewModelState(
      {final String title,
      final int emergencyPoint,
      final int priorityPoint,
      final int status}) = _$_CommonBottomSheetViewModelState;

  @override
  String get title;
  @override
  int get emergencyPoint;
  @override
  int get priorityPoint;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$_CommonBottomSheetViewModelStateCopyWith<
          _$_CommonBottomSheetViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}
