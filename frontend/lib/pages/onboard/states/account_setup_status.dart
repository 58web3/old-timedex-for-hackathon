import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/account_setup_status.freezed.dart';

@freezed
class AccountSetupStatus with _$AccountSetupStatus {
  const factory AccountSetupStatus({
    @Default(0) int index,
    @Default('') String message,
  }) = _AccountSetupStatus;
}
