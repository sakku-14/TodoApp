// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_bottom_sheet_view_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddBottomSheetViewModelState {
  bool get isAddable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddBottomSheetViewModelStateCopyWith<AddBottomSheetViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddBottomSheetViewModelStateCopyWith<$Res> {
  factory $AddBottomSheetViewModelStateCopyWith(
          AddBottomSheetViewModelState value,
          $Res Function(AddBottomSheetViewModelState) then) =
      _$AddBottomSheetViewModelStateCopyWithImpl<$Res,
          AddBottomSheetViewModelState>;
  @useResult
  $Res call({bool isAddable});
}

/// @nodoc
class _$AddBottomSheetViewModelStateCopyWithImpl<$Res,
        $Val extends AddBottomSheetViewModelState>
    implements $AddBottomSheetViewModelStateCopyWith<$Res> {
  _$AddBottomSheetViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAddable = null,
  }) {
    return _then(_value.copyWith(
      isAddable: null == isAddable
          ? _value.isAddable
          : isAddable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddBottomSheetViewModelStateCopyWith<$Res>
    implements $AddBottomSheetViewModelStateCopyWith<$Res> {
  factory _$$_AddBottomSheetViewModelStateCopyWith(
          _$_AddBottomSheetViewModelState value,
          $Res Function(_$_AddBottomSheetViewModelState) then) =
      __$$_AddBottomSheetViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAddable});
}

/// @nodoc
class __$$_AddBottomSheetViewModelStateCopyWithImpl<$Res>
    extends _$AddBottomSheetViewModelStateCopyWithImpl<$Res,
        _$_AddBottomSheetViewModelState>
    implements _$$_AddBottomSheetViewModelStateCopyWith<$Res> {
  __$$_AddBottomSheetViewModelStateCopyWithImpl(
      _$_AddBottomSheetViewModelState _value,
      $Res Function(_$_AddBottomSheetViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAddable = null,
  }) {
    return _then(_$_AddBottomSheetViewModelState(
      isAddable: null == isAddable
          ? _value.isAddable
          : isAddable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddBottomSheetViewModelState implements _AddBottomSheetViewModelState {
  const _$_AddBottomSheetViewModelState({this.isAddable = false});

  @override
  @JsonKey()
  final bool isAddable;

  @override
  String toString() {
    return 'AddBottomSheetViewModelState(isAddable: $isAddable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddBottomSheetViewModelState &&
            (identical(other.isAddable, isAddable) ||
                other.isAddable == isAddable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAddable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddBottomSheetViewModelStateCopyWith<_$_AddBottomSheetViewModelState>
      get copyWith => __$$_AddBottomSheetViewModelStateCopyWithImpl<
          _$_AddBottomSheetViewModelState>(this, _$identity);
}

abstract class _AddBottomSheetViewModelState
    implements AddBottomSheetViewModelState {
  const factory _AddBottomSheetViewModelState({final bool isAddable}) =
      _$_AddBottomSheetViewModelState;

  @override
  bool get isAddable;
  @override
  @JsonKey(ignore: true)
  _$$_AddBottomSheetViewModelStateCopyWith<_$_AddBottomSheetViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}
