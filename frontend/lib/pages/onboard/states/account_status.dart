import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/account_status.freezed.dart';

@freezed
class AccountStatus with _$AccountStatus {
  const factory AccountStatus({
    @Default('') String nickName,
    @Default('') String email,
    @Default('') String walletAddress,
  }) = _AccountStatus;
}
