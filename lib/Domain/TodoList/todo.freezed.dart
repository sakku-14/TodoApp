// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Todo {
  DateTime get createAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get emergencyPoint => throw _privateConstructorUsedError;
  int get priorityPoint => throw _privateConstructorUsedError;
  TabState get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res, Todo>;
  @useResult
  $Res call(
      {DateTime createAt,
      String title,
      int emergencyPoint,
      int priorityPoint,
      TabState status});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res, $Val extends Todo>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createAt = null,
    Object? title = null,
    Object? emergencyPoint = null,
    Object? priorityPoint = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as TabState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodoCopyWith(_$_Todo value, $Res Function(_$_Todo) then) =
      __$$_TodoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime createAt,
      String title,
      int emergencyPoint,
      int priorityPoint,
      TabState status});
}

/// @nodoc
class __$$_TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res, _$_Todo>
    implements _$$_TodoCopyWith<$Res> {
  __$$_TodoCopyWithImpl(_$_Todo _value, $Res Function(_$_Todo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createAt = null,
    Object? title = null,
    Object? emergencyPoint = null,
    Object? priorityPoint = null,
    Object? status = null,
  }) {
    return _then(_$_Todo(
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as TabState,
    ));
  }
}

/// @nodoc

class _$_Todo extends _Todo {
  _$_Todo(
      {required this.createAt,
      required this.title,
      required this.emergencyPoint,
      required this.priorityPoint,
      required this.status})
      : super._();

  @override
  final DateTime createAt;
  @override
  final String title;
  @override
  final int emergencyPoint;
  @override
  final int priorityPoint;
  @override
  final TabState status;

  @override
  String toString() {
    return 'Todo(createAt: $createAt, title: $title, emergencyPoint: $emergencyPoint, priorityPoint: $priorityPoint, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.emergencyPoint, emergencyPoint) ||
                other.emergencyPoint == emergencyPoint) &&
            (identical(other.priorityPoint, priorityPoint) ||
                other.priorityPoint == priorityPoint) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, createAt, title, emergencyPoint, priorityPoint, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoCopyWith<_$_Todo> get copyWith =>
      __$$_TodoCopyWithImpl<_$_Todo>(this, _$identity);
}

abstract class _Todo extends Todo {
  factory _Todo(
      {required final DateTime createAt,
      required final String title,
      required final int emergencyPoint,
      required final int priorityPoint,
      required final TabState status}) = _$_Todo;
  _Todo._() : super._();

  @override
  DateTime get createAt;
  @override
  String get title;
  @override
  int get emergencyPoint;
  @override
  int get priorityPoint;
  @override
  TabState get status;
  @override
  @JsonKey(ignore: true)
  _$$_TodoCopyWith<_$_Todo> get copyWith => throw _privateConstructorUsedError;
}
