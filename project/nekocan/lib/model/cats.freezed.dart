// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cats _$CatsFromJson(Map<String, dynamic> json) {
  return _Cats.fromJson(json);
}

/// @nodoc
class _$CatsTearOff {
  const _$CatsTearOff();

  _Cats call(
      {required int id,
      required String name,
      required String gender,
      required String birthday,
      required String memo,
      required DateTime createdAt}) {
    return _Cats(
      id: id,
      name: name,
      gender: gender,
      birthday: birthday,
      memo: memo,
      createdAt: createdAt,
    );
  }

  Cats fromJson(Map<String, Object?> json) {
    return Cats.fromJson(json);
  }
}

/// @nodoc
const $Cats = _$CatsTearOff();

/// @nodoc
mixin _$Cats {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatsCopyWith<Cats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatsCopyWith<$Res> {
  factory $CatsCopyWith(Cats value, $Res Function(Cats) then) =
      _$CatsCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String gender,
      String birthday,
      String memo,
      DateTime createdAt});
}

/// @nodoc
class _$CatsCopyWithImpl<$Res> implements $CatsCopyWith<$Res> {
  _$CatsCopyWithImpl(this._value, this._then);

  final Cats _value;
  // ignore: unused_field
  final $Res Function(Cats) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? memo = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$CatsCopyWith<$Res> implements $CatsCopyWith<$Res> {
  factory _$CatsCopyWith(_Cats value, $Res Function(_Cats) then) =
      __$CatsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String gender,
      String birthday,
      String memo,
      DateTime createdAt});
}

/// @nodoc
class __$CatsCopyWithImpl<$Res> extends _$CatsCopyWithImpl<$Res>
    implements _$CatsCopyWith<$Res> {
  __$CatsCopyWithImpl(_Cats _value, $Res Function(_Cats) _then)
      : super(_value, (v) => _then(v as _Cats));

  @override
  _Cats get _value => super._value as _Cats;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? memo = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Cats(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cats implements _Cats {
  const _$_Cats(
      {required this.id,
      required this.name,
      required this.gender,
      required this.birthday,
      required this.memo,
      required this.createdAt});

  factory _$_Cats.fromJson(Map<String, dynamic> json) => _$$_CatsFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String gender;
  @override
  final String birthday;
  @override
  final String memo;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Cats(id: $id, name: $name, gender: $gender, birthday: $birthday, memo: $memo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Cats &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.birthday, birthday) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(birthday),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$CatsCopyWith<_Cats> get copyWith =>
      __$CatsCopyWithImpl<_Cats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CatsToJson(this);
  }
}

abstract class _Cats implements Cats {
  const factory _Cats(
      {required int id,
      required String name,
      required String gender,
      required String birthday,
      required String memo,
      required DateTime createdAt}) = _$_Cats;

  factory _Cats.fromJson(Map<String, dynamic> json) = _$_Cats.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get gender;
  @override
  String get birthday;
  @override
  String get memo;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$CatsCopyWith<_Cats> get copyWith => throw _privateConstructorUsedError;
}
