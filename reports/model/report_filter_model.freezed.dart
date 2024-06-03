// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportFilterModel _$ReportFilterModelFromJson(Map<String, dynamic> json) {
  return _ReportFilterModel.fromJson(json);
}

/// @nodoc
mixin _$ReportFilterModel {
  List<ReportType>? get types => throw _privateConstructorUsedError;
  SortType? get sort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportFilterModelCopyWith<ReportFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportFilterModelCopyWith<$Res> {
  factory $ReportFilterModelCopyWith(
          ReportFilterModel value, $Res Function(ReportFilterModel) then) =
      _$ReportFilterModelCopyWithImpl<$Res, ReportFilterModel>;
  @useResult
  $Res call({List<ReportType>? types, SortType? sort});
}

/// @nodoc
class _$ReportFilterModelCopyWithImpl<$Res, $Val extends ReportFilterModel>
    implements $ReportFilterModelCopyWith<$Res> {
  _$ReportFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = freezed,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ReportType>?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportFilterModelImplCopyWith<$Res>
    implements $ReportFilterModelCopyWith<$Res> {
  factory _$$ReportFilterModelImplCopyWith(_$ReportFilterModelImpl value,
          $Res Function(_$ReportFilterModelImpl) then) =
      __$$ReportFilterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReportType>? types, SortType? sort});
}

/// @nodoc
class __$$ReportFilterModelImplCopyWithImpl<$Res>
    extends _$ReportFilterModelCopyWithImpl<$Res, _$ReportFilterModelImpl>
    implements _$$ReportFilterModelImplCopyWith<$Res> {
  __$$ReportFilterModelImplCopyWithImpl(_$ReportFilterModelImpl _value,
      $Res Function(_$ReportFilterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$ReportFilterModelImpl(
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ReportType>?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportFilterModelImpl implements _ReportFilterModel {
  const _$ReportFilterModelImpl(
      {required final List<ReportType>? types, required this.sort})
      : _types = types;

  factory _$ReportFilterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportFilterModelImplFromJson(json);

  final List<ReportType>? _types;
  @override
  List<ReportType>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SortType? sort;

  @override
  String toString() {
    return 'ReportFilterModel(types: $types, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportFilterModelImpl &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_types), sort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportFilterModelImplCopyWith<_$ReportFilterModelImpl> get copyWith =>
      __$$ReportFilterModelImplCopyWithImpl<_$ReportFilterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportFilterModelImplToJson(
      this,
    );
  }
}

abstract class _ReportFilterModel implements ReportFilterModel {
  const factory _ReportFilterModel(
      {required final List<ReportType>? types,
      required final SortType? sort}) = _$ReportFilterModelImpl;

  factory _ReportFilterModel.fromJson(Map<String, dynamic> json) =
      _$ReportFilterModelImpl.fromJson;

  @override
  List<ReportType>? get types;
  @override
  SortType? get sort;
  @override
  @JsonKey(ignore: true)
  _$$ReportFilterModelImplCopyWith<_$ReportFilterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
