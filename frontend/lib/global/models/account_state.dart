import 'dart:math';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/api.dart';

part 'generated/account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default('') String profileUrl,
    @Default('') String accountName,
    @Default('') String email,
    @Default('') String walletAddress,
    @Default(null) Color? background,
  }) = _AccountState;

  const AccountState._();

  factory AccountState.fromUser(User user, String wa) => AccountState(
        profileUrl: '',
        accountName: user.nickname ?? '',
        email: user.email ?? '',
        walletAddress: wa,
        background: Color(
          (Random().nextDouble() * 0xFFFFFF).toInt() << 0,
        ).withOpacity(1),
      );
}
