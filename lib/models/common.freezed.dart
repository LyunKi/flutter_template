// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Paginated<T> _$PaginatedFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Paginated<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Paginated<T> {
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get totalNum => throw _privateConstructorUsedError;
  int get totalPage => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedCopyWith<T, Paginated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedCopyWith<T, $Res> {
  factory $PaginatedCopyWith(
          Paginated<T> value, $Res Function(Paginated<T>) then) =
      _$PaginatedCopyWithImpl<T, $Res, Paginated<T>>;
  @useResult
  $Res call(
      {int page, int pageSize, int totalNum, int totalPage, List<T> items});
}

/// @nodoc
class _$PaginatedCopyWithImpl<T, $Res, $Val extends Paginated<T>>
    implements $PaginatedCopyWith<T, $Res> {
  _$PaginatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? totalNum = null,
    Object? totalPage = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalNum: null == totalNum
          ? _value.totalNum
          : totalNum // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedImplCopyWith<T, $Res>
    implements $PaginatedCopyWith<T, $Res> {
  factory _$$PaginatedImplCopyWith(
          _$PaginatedImpl<T> value, $Res Function(_$PaginatedImpl<T>) then) =
      __$$PaginatedImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int page, int pageSize, int totalNum, int totalPage, List<T> items});
}

/// @nodoc
class __$$PaginatedImplCopyWithImpl<T, $Res>
    extends _$PaginatedCopyWithImpl<T, $Res, _$PaginatedImpl<T>>
    implements _$$PaginatedImplCopyWith<T, $Res> {
  __$$PaginatedImplCopyWithImpl(
      _$PaginatedImpl<T> _value, $Res Function(_$PaginatedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? totalNum = null,
    Object? totalPage = null,
    Object? items = null,
  }) {
    return _then(_$PaginatedImpl<T>(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalNum: null == totalNum
          ? _value.totalNum
          : totalNum // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginatedImpl<T> implements _Paginated<T> {
  const _$PaginatedImpl(
      {required this.page,
      required this.pageSize,
      required this.totalNum,
      required this.totalPage,
      required final List<T> items})
      : _items = items;

  factory _$PaginatedImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PaginatedImplFromJson(json, fromJsonT);

  @override
  final int page;
  @override
  final int pageSize;
  @override
  final int totalNum;
  @override
  final int totalPage;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Paginated<$T>(page: $page, pageSize: $pageSize, totalNum: $totalNum, totalPage: $totalPage, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedImpl<T> &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalNum, totalNum) ||
                other.totalNum == totalNum) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, pageSize, totalNum,
      totalPage, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedImplCopyWith<T, _$PaginatedImpl<T>> get copyWith =>
      __$$PaginatedImplCopyWithImpl<T, _$PaginatedImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PaginatedImplToJson<T>(this, toJsonT);
  }
}

abstract class _Paginated<T> implements Paginated<T> {
  const factory _Paginated(
      {required final int page,
      required final int pageSize,
      required final int totalNum,
      required final int totalPage,
      required final List<T> items}) = _$PaginatedImpl<T>;

  factory _Paginated.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PaginatedImpl<T>.fromJson;

  @override
  int get page;
  @override
  int get pageSize;
  @override
  int get totalNum;
  @override
  int get totalPage;
  @override
  List<T> get items;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedImplCopyWith<T, _$PaginatedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
