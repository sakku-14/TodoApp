// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditTodoState {
  DateTime? get createAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get emergencyPoint => throw _privateConstructorUsedError;
  int get primaryPoint => throw _privateConstructorUsedError;
  TabState get tabStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditTodoStateCopyWith<EditTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTodoStateCopyWith<$Res> {
  factory $EditTodoStateCopyWith(
          EditTodoState value, $Res Function(EditTodoState) then) =
      _$EditTodoStateCopyWithImpl<$Res, EditTodoState>;
  @useResult
  $Res call(
      {DateTime? createAt,
      String title,
      int emergencyPoint,
      int primaryPoint,
      TabState tabStatus});
}

/// @nodoc
class _$EditTodoStateCopyWithImpl<$Res, $Val extends EditTodoState>
    implements $EditTodoStateCopyWith<$Res> {
  _$EditTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createAt = freezed,
    Object? title = null,
    Object? emergencyPoint = null,
    Object? primaryPoint = null,
    Object? tabStatus = null,
  }) {
    return _then(_value.copyWith(
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      emergencyPoint: null == emergencyPoint
          ? _value.emergencyPoint
          : emergencyPoint // ignore: cast_nullable_to_non_nullable
              as int,
      primaryPoint: null == primaryPoint
          ? _value.primaryPoint
          : primaryPoint // ignore: cast_nullable_to_non_nullable
              as int,
      tabStatus: null == tabStatus
          ? _value.tabStatus
          : tabStatus // ignore: cast_nullable_to_non_nullable
              as TabState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditTodoStateCopyWith<$Res>
    implements $EditTodoStateCopyWith<$Res> {
  factory _$$_EditTodoStateCopyWith(
          _$_EditTodoState value, $Res Function(_$_EditTodoState) then) =
      __$$_EditTodoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? createAt,
      String title,
      int emergencyPoint,
      int primaryPoint,
      TabState tabStatus});
}

/// @nodoc
class __$$_EditTodoStateCopyWithImpl<$Res>
    extends _$EditTodoStateCopyWithImpl<$Res, _$_EditTodoState>
    implements _$$_EditTodoStateCopyWith<$Res> {
  __$$_EditTodoStateCopyWithImpl(
      _$_EditTodoState _value, $Res Function(_$_EditTodoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createAt = freezed,
    Object? title = null,
    Object? emergencyPoint = null,
    Object? primaryPoint = null,
    Object? tabStatus = null,
  }) {
    return _then(_$_EditTodoState(
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      emergencyPoint: null == emergencyPoint
          ? _value.emergencyPoint
          : emergencyPoint // ignore: cast_nullable_to_non_nullable
              as int,
      primaryPoint: null == primaryPoint
          ? _value.primaryPoint
          : primaryPoint // ignore: cast_nullable_to_non_nullable
              as int,
      tabStatus: null == tabStatus
          ? _value.tabStatus
          : tabStatus // ignore: cast_nullable_to_non_nullable
              as TabState,
    ));
  }
}

/// @nodoc

class _$_EditTodoState extends _EditTodoState {
  _$_EditTodoState(
      {this.createAt,
      this.title = '',
      this.emergencyPoint = 1,
      this.primaryPoint = 1,
      this.tabStatus = TabState.notBegin})
      : super._();

  @override
  final DateTime? createAt;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int emergencyPoint;
  @override
  @JsonKey()
  final int primaryPoint;
  @override
  @JsonKey()
  final TabState tabStatus;

  @override
  String toString() {
    return 'EditTodoState(createAt: $createAt, title: $title, emergencyPoint: $emergencyPoint, primaryPoint: $primaryPoint, tabStatus: $tabStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditTodoState &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.emergencyPoint, emergencyPoint) ||
                other.emergencyPoint == emergencyPoint) &&
            (identical(other.primaryPoint, primaryPoint) ||
                other.primaryPoint == primaryPoint) &&
            (identical(other.tabStatus, tabStatus) ||
                other.tabStatus == tabStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, createAt, title, emergencyPoint, primaryPoint, tabStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditTodoStateCopyWith<_$_EditTodoState> get copyWith =>
      __$$_EditTodoStateCopyWithImpl<_$_EditTodoState>(this, _$identity);
}

abstract class _EditTodoState extends EditTodoState {
  factory _EditTodoState(
      {final DateTime? createAt,
      final String title,
      final int emergencyPoint,
      final int primaryPoint,
      final TabState tabStatus}) = _$_EditTodoState;
  _EditTodoState._() : super._();

  @override
  DateTime? get createAt;
  @override
  String get title;
  @override
  int get emergencyPoint;
  @override
  int get primaryPoint;
  @override
  TabState get tabStatus;
  @override
  @JsonKey(ignore: true)
  _$$_EditTodoStateCopyWith<_$_EditTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}
