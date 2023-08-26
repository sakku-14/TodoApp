// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_combo_box_view_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SortComboBoxViewModelState {
  String get sortComboBoxValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortComboBoxViewModelStateCopyWith<SortComboBoxViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortComboBoxViewModelStateCopyWith<$Res> {
  factory $SortComboBoxViewModelStateCopyWith(SortComboBoxViewModelState value,
          $Res Function(SortComboBoxViewModelState) then) =
      _$SortComboBoxViewModelStateCopyWithImpl<$Res,
          SortComboBoxViewModelState>;
  @useResult
  $Res call({String sortComboBoxValue});
}

/// @nodoc
class _$SortComboBoxViewModelStateCopyWithImpl<$Res,
        $Val extends SortComboBoxViewModelState>
    implements $SortComboBoxViewModelStateCopyWith<$Res> {
  _$SortComboBoxViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortComboBoxValue = null,
  }) {
    return _then(_value.copyWith(
      sortComboBoxValue: null == sortComboBoxValue
          ? _value.sortComboBoxValue
          : sortComboBoxValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortComboBoxViewModelStateCopyWith<$Res>
    implements $SortComboBoxViewModelStateCopyWith<$Res> {
  factory _$$_SortComboBoxViewModelStateCopyWith(
          _$_SortComboBoxViewModelState value,
          $Res Function(_$_SortComboBoxViewModelState) then) =
      __$$_SortComboBoxViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sortComboBoxValue});
}

/// @nodoc
class __$$_SortComboBoxViewModelStateCopyWithImpl<$Res>
    extends _$SortComboBoxViewModelStateCopyWithImpl<$Res,
        _$_SortComboBoxViewModelState>
    implements _$$_SortComboBoxViewModelStateCopyWith<$Res> {
  __$$_SortComboBoxViewModelStateCopyWithImpl(
      _$_SortComboBoxViewModelState _value,
      $Res Function(_$_SortComboBoxViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortComboBoxValue = null,
  }) {
    return _then(_$_SortComboBoxViewModelState(
      sortComboBoxValue: null == sortComboBoxValue
          ? _value.sortComboBoxValue
          : sortComboBoxValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SortComboBoxViewModelState implements _SortComboBoxViewModelState {
  const _$_SortComboBoxViewModelState({this.sortComboBoxValue = '登録日時'});

  @override
  @JsonKey()
  final String sortComboBoxValue;

  @override
  String toString() {
    return 'SortComboBoxViewModelState(sortComboBoxValue: $sortComboBoxValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortComboBoxViewModelState &&
            (identical(other.sortComboBoxValue, sortComboBoxValue) ||
                other.sortComboBoxValue == sortComboBoxValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortComboBoxValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortComboBoxViewModelStateCopyWith<_$_SortComboBoxViewModelState>
      get copyWith => __$$_SortComboBoxViewModelStateCopyWithImpl<
          _$_SortComboBoxViewModelState>(this, _$identity);
}

abstract class _SortComboBoxViewModelState
    implements SortComboBoxViewModelState {
  const factory _SortComboBoxViewModelState({final String sortComboBoxValue}) =
      _$_SortComboBoxViewModelState;

  @override
  String get sortComboBoxValue;
  @override
  @JsonKey(ignore: true)
  _$$_SortComboBoxViewModelStateCopyWith<_$_SortComboBoxViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}
