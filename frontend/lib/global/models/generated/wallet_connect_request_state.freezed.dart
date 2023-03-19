// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../wallet_connect_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletConnectRequestState {
  String get currentAddress => throw _privateConstructorUsedError;
  int get currentChain => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletConnectRequestStateCopyWith<WalletConnectRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletConnectRequestStateCopyWith<$Res> {
  factory $WalletConnectRequestStateCopyWith(WalletConnectRequestState value,
          $Res Function(WalletConnectRequestState) then) =
      _$WalletConnectRequestStateCopyWithImpl<$Res, WalletConnectRequestState>;
  @useResult
  $Res call({String currentAddress, int currentChain, bool isConnected});
}

/// @nodoc
class _$WalletConnectRequestStateCopyWithImpl<$Res,
        $Val extends WalletConnectRequestState>
    implements $WalletConnectRequestStateCopyWith<$Res> {
  _$WalletConnectRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentAddress = null,
    Object? currentChain = null,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      currentAddress: null == currentAddress
          ? _value.currentAddress
          : currentAddress // ignore: cast_nullable_to_non_nullable
              as String,
      currentChain: null == currentChain
          ? _value.currentChain
          : currentChain // ignore: cast_nullable_to_non_nullable
              as int,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletConnectRequestStateCopyWith<$Res>
    implements $WalletConnectRequestStateCopyWith<$Res> {
  factory _$$_WalletConnectRequestStateCopyWith(
          _$_WalletConnectRequestState value,
          $Res Function(_$_WalletConnectRequestState) then) =
      __$$_WalletConnectRequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentAddress, int currentChain, bool isConnected});
}

/// @nodoc
class __$$_WalletConnectRequestStateCopyWithImpl<$Res>
    extends _$WalletConnectRequestStateCopyWithImpl<$Res,
        _$_WalletConnectRequestState>
    implements _$$_WalletConnectRequestStateCopyWith<$Res> {
  __$$_WalletConnectRequestStateCopyWithImpl(
      _$_WalletConnectRequestState _value,
      $Res Function(_$_WalletConnectRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentAddress = null,
    Object? currentChain = null,
    Object? isConnected = null,
  }) {
    return _then(_$_WalletConnectRequestState(
      currentAddress: null == currentAddress
          ? _value.currentAddress
          : currentAddress // ignore: cast_nullable_to_non_nullable
              as String,
      currentChain: null == currentChain
          ? _value.currentChain
          : currentChain // ignore: cast_nullable_to_non_nullable
              as int,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_WalletConnectRequestState implements _WalletConnectRequestState {
  const _$_WalletConnectRequestState(
      {this.currentAddress = '',
      this.currentChain = -1,
      this.isConnected = false});

  @override
  @JsonKey()
  final String currentAddress;
  @override
  @JsonKey()
  final int currentChain;
  @override
  @JsonKey()
  final bool isConnected;

  @override
  String toString() {
    return 'WalletConnectRequestState(currentAddress: $currentAddress, currentChain: $currentChain, isConnected: $isConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletConnectRequestState &&
            (identical(other.currentAddress, currentAddress) ||
                other.currentAddress == currentAddress) &&
            (identical(other.currentChain, currentChain) ||
                other.currentChain == currentChain) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentAddress, currentChain, isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletConnectRequestStateCopyWith<_$_WalletConnectRequestState>
      get copyWith => __$$_WalletConnectRequestStateCopyWithImpl<
          _$_WalletConnectRequestState>(this, _$identity);
}

abstract class _WalletConnectRequestState implements WalletConnectRequestState {
  const factory _WalletConnectRequestState(
      {final String currentAddress,
      final int currentChain,
      final bool isConnected}) = _$_WalletConnectRequestState;

  @override
  String get currentAddress;
  @override
  int get currentChain;
  @override
  bool get isConnected;
  @override
  @JsonKey(ignore: true)
  _$$_WalletConnectRequestStateCopyWith<_$_WalletConnectRequestState>
      get copyWith => throw _privateConstructorUsedError;
}
