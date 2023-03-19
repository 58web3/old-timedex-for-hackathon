import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_dex/constants/enums.dart';

class MemberInviteStatusConverter
    implements JsonConverter<MemberInviteStatus, String> {
  const MemberInviteStatusConverter();

  @override
  MemberInviteStatus fromJson(String json) {
    return MemberInviteStatus.values.from(json);
  }

  @override
  String toJson(MemberInviteStatus object) {
    return object.label;
  }
}
