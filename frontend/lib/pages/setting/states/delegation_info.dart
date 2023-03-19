import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/delegation_info.freezed.dart';

@freezed
class DelegationInfo with _$DelegationInfo {
  const factory DelegationInfo({
    @Default('') String profileUrl,
    @Default('') String walletAddress,
    @Default('') String name,
    @Default('') String email,
  }) = _DelegationInfo;
}
