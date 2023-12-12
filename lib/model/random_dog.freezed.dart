// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'random_dog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RandomDog _$RandomDogFromJson(Map<String, dynamic> json) {
  return _RandomDog.fromJson(json);
}

/// @nodoc
mixin _$RandomDog {
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RandomDogCopyWith<RandomDog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RandomDogCopyWith<$Res> {
  factory $RandomDogCopyWith(RandomDog value, $Res Function(RandomDog) then) =
      _$RandomDogCopyWithImpl<$Res, RandomDog>;
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "status") String? status});
}

/// @nodoc
class _$RandomDogCopyWithImpl<$Res, $Val extends RandomDog>
    implements $RandomDogCopyWith<$Res> {
  _$RandomDogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RandomDogImplCopyWith<$Res>
    implements $RandomDogCopyWith<$Res> {
  factory _$$RandomDogImplCopyWith(
          _$RandomDogImpl value, $Res Function(_$RandomDogImpl) then) =
      __$$RandomDogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "status") String? status});
}

/// @nodoc
class __$$RandomDogImplCopyWithImpl<$Res>
    extends _$RandomDogCopyWithImpl<$Res, _$RandomDogImpl>
    implements _$$RandomDogImplCopyWith<$Res> {
  __$$RandomDogImplCopyWithImpl(
      _$RandomDogImpl _value, $Res Function(_$RandomDogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_$RandomDogImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RandomDogImpl implements _RandomDog {
  const _$RandomDogImpl(
      {@JsonKey(name: "message") this.message,
      @JsonKey(name: "status") this.status});

  factory _$RandomDogImpl.fromJson(Map<String, dynamic> json) =>
      _$$RandomDogImplFromJson(json);

  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "status")
  final String? status;

  @override
  String toString() {
    return 'RandomDog(message: $message, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RandomDogImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RandomDogImplCopyWith<_$RandomDogImpl> get copyWith =>
      __$$RandomDogImplCopyWithImpl<_$RandomDogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RandomDogImplToJson(
      this,
    );
  }
}

abstract class _RandomDog implements RandomDog {
  const factory _RandomDog(
      {@JsonKey(name: "message") final String? message,
      @JsonKey(name: "status") final String? status}) = _$RandomDogImpl;

  factory _RandomDog.fromJson(Map<String, dynamic> json) =
      _$RandomDogImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$RandomDogImplCopyWith<_$RandomDogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
