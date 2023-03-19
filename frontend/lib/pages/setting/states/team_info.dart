import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_dex/constants/enums.dart';
part 'generated/team_info.freezed.dart';

@freezed
class AddTeam with _$AddTeam {
  const factory AddTeam({
    @Default('') String name,
    @Default('') String description,
    @Default({}) Set<String> members,
  }) = _AddTeam;
}

@freezed
class TeamInfo with _$TeamInfo {
  const factory TeamInfo({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @Default([]) List<MemberInfo> members,
  }) = _TeamInfo;
}

@freezed
class MemberInfo with _$MemberInfo {
  const factory MemberInfo({
    @Default('') String walletAddress,
    @Default('') String name,
    @Default('') String email,
    @Default('') String profileUrl,
    @Default(MemberInviteStatus.unknown) MemberInviteStatus status,
  }) = _MemberInfo;
}
