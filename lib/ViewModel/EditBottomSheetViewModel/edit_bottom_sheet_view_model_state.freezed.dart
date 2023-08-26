// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_bottom_sheet_view_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditBottomSheetViewModelState {
  String get todoTitle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditBottomSheetViewModelStateCopyWith<EditBottomSheetViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditBottomSheetViewModelStateCopyWith<$Res> {
  factory $EditBottomSheetViewModelStateCopyWith(
          EditBottomSheetViewModelState value,
          $Res Function(EditBottomSheetViewModelState) then) =
      _$EditBottomSheetViewModelStateCopyWithImpl<$Res,
          EditBottomSheetViewModelState>;
  @useResult
  $Res call({String todoTitle});
}

/// @nodoc
class _$EditBottomSheetViewModelStateCopyWithImpl<$Res,
        $Val extends EditBottomSheetViewModelState>
    implements $EditBottomSheetViewModelStateCopyWith<$Res> {
  _$EditBottomSheetViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoTitle = null,
  }) {
    return _then(_value.copyWith(
      todoTitle: null == todoTitle
          ? _value.todoTitle
          : todoTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditBottomSheetViewModelStateCopyWith<$Res>
    implements $EditBottomSheetViewModelStateCopyWith<$Res> {
  factory _$$_EditBottomSheetViewModelStateCopyWith(
          _$_EditBottomSheetViewModelState value,
          $Res Function(_$_EditBottomSheetViewModelState) then) =
      __$$_EditBottomSheetViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String todoTitle});
}

/// @nodoc
class __$$_EditBottomSheetViewModelStateCopyWithImpl<$Res>
    extends _$EditBottomSheetViewModelStateCopyWithImpl<$Res,
        _$_EditBottomSheetViewModelState>
    implements _$$_EditBottomSheetViewModelStateCopyWith<$Res> {
  __$$_EditBottomSheetViewModelStateCopyWithImpl(
      _$_EditBottomSheetViewModelState _value,
      $Res Function(_$_EditBottomSheetViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoTitle = null,
  }) {
    return _then(_$_EditBottomSheetViewModelState(
      todoTitle: null == todoTitle
          ? _value.todoTitle
          : todoTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EditBottomSheetViewModelState
    implements _EditBottomSheetViewModelState {
  const _$_EditBottomSheetViewModelState({this.todoTitle = 'Todo Title'});

  @override
  @JsonKey()
  final String todoTitle;

  @override
  String toString() {
    return 'EditBottomSheetViewModelState(todoTitle: $todoTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditBottomSheetViewModelState &&
            (identical(other.todoTitle, todoTitle) ||
                other.todoTitle == todoTitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditBottomSheetViewModelStateCopyWith<_$_EditBottomSheetViewModelState>
      get copyWith => __$$_EditBottomSheetViewModelStateCopyWithImpl<
          _$_EditBottomSheetViewModelState>(this, _$identity);
}

abstract class _EditBottomSheetViewModelState
    implements EditBottomSheetViewModelState {
  const factory _EditBottomSheetViewModelState({final String todoTitle}) =
      _$_EditBottomSheetViewModelState;

  @override
  String get todoTitle;
  @override
  @JsonKey(ignore: true)
  _$$_EditBottomSheetViewModelStateCopyWith<_$_EditBottomSheetViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}
