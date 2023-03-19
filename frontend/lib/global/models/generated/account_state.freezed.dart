// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountState {
  String get profileUrl => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  Color? get background => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
  @useResult
  $Res call(
      {String profileUrl,
      String accountName,
      String email,
      String walletAddress,
      Color? background});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileUrl = null,
    Object? accountName = null,
    Object? email = null,
    Object? walletAddress = null,
    Object? background = freezed,
  }) {
    return _then(_value.copyWith(
      profileUrl: null == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountStateCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$_AccountStateCopyWith(
          _$_AccountState value, $Res Function(_$_AccountState) then) =
      __$$_AccountStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String profileUrl,
      String accountName,
      String email,
      String walletAddress,
      Color? background});
}

/// @nodoc
class __$$_AccountStateCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_AccountState>
    implements _$$_AccountStateCopyWith<$Res> {
  __$$_AccountStateCopyWithImpl(
      _$_AccountState _value, $Res Function(_$_AccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileUrl = null,
    Object? accountName = null,
    Object? email = null,
    Object? walletAddress = null,
    Object? background = freezed,
  }) {
    return _then(_$_AccountState(
      profileUrl: null == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_AccountState extends _AccountState {
  const _$_AccountState(
      {this.profileUrl = '',
      this.accountName = '',
      this.email = '',
      this.walletAddress = '',
      this.background = null})
      : super._();

  @override
  @JsonKey()
  final String profileUrl;
  @override
  @JsonKey()
  final String accountName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String walletAddress;
  @override
  @JsonKey()
  final Color? background;

  @override
  String toString() {
    return 'AccountState(profileUrl: $profileUrl, accountName: $accountName, email: $email, walletAddress: $walletAddress, background: $background)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountState &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.background, background) ||
                other.background == background));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, profileUrl, accountName, email, walletAddress, background);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountStateCopyWith<_$_AccountState> get copyWith =>
      __$$_AccountStateCopyWithImpl<_$_AccountState>(this, _$identity);
}

abstract class _AccountState extends AccountState {
  const factory _AccountState(
      {final String profileUrl,
      final String accountName,
      final String email,
      final String walletAddress,
      final Color? background}) = _$_AccountState;
  const _AccountState._() : super._();

  @override
  String get profileUrl;
  @override
  String get accountName;
  @override
  String get email;
  @override
  String get walletAddress;
  @override
  Color? get background;
  @override
  @JsonKey(ignore: true)
  _$$_AccountStateCopyWith<_$_AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
