import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';
import 'package:time_dex/global/providers.dart';
import 'package:time_dex/global/repositories/apis_repository/calendar_api_repository.dart';

import '../providers.dart';

final calendarManageUsecaseProvider = Provider<CalendarManageUsecase>(
  (ref) => CalendarManageUsecase(ref: ref),
);

class CalendarManageUsecase {
  CalendarManageUsecase({
    required Ref ref,
  }) : _ref = ref;

  final Ref _ref;

  Future<void> fetchTeamCalendar() async {
    final walletAddress = _ref.watch(currentUserWalletProvider);
    final teamIds = _ref.watch(currentUserProvider)?.teamsIds ?? [];
    for (final teamId in teamIds) {
      //TODO(yodai-hi):get  /v1/calendar APIを呼ぶ
    }
  }

  Future<void> fetchPersonalCalendar() async {
    final walletAddress = _ref.watch(currentUserWalletProvider);
    //TODO(yodai-hi): get /v1/calendar APIを呼ぶ

    //TODO(yodai-hi): Userのカレンダーidを保持
    _ref.watch(userCalendarIdProvider.notifier).update((state) => state);
  }

  String formatDt(DateTime? dt) {
    DateFormat format = DateFormat('yyyyMMddTHHmmss');
    if (dt != null) {
      return format.format(dt);
    }
    return '';
  }

  Future<void> addEvent() async {
    await initializeDateFormatting('ja_JP');

    final event = _ref.read(addEventProvider);
    final jwt =
        await _ref.watch(secureStorageProvider).read(key: 'jwt') as String;
    final calendarId = await _ref
        .watch(secureStorageProvider)
        .read(key: 'calendar_id') as String;
    final Booking booking = new Booking();
    booking.title = event.title;
    booking.priority = event.priority.label;
    booking.start = formatDt(event.start);
    booking.end = formatDt(event.end);
    booking.attendees = event.walletAddresses;
    booking.summary = event.description;

    // post /v1/calendar APIを呼ぶ
    await _ref.read(calendarApiRepositoryProvider).addBooking(
          jwt,
          calendarId,
          booking: booking,
        );
  }

  Future<void> updateEvent() async {
    final event = _ref.read(updateEventProvider);
    if (event == null) {
      return;
    }
    //TODO(yodai-hi): put /v1/calendar APIを呼ぶ
  }

  Future<void> deleteEvent() async {
    final eventId = _ref.read(deleteEventProvider);
    //TODO(yodai-hi): del /v1/calendar APIを呼ぶ
  }

  Future<void> publishCalendar() async {
    final targetTeamIds = _ref.watch(publishTeamIdProvider);
    final walletAddress = _ref.watch(currentUserWalletProvider);
    //TODO(yodai-hi): フロントで署名(Mint用)
    // UI的に署名してくださいを出すべき？

    //TODO(yodai-hi): フロントで署名(チーム用？)
    // UI的に署名してくださいを出すべき？

    //TODO(yodai-hi): フローが正常に終了したことを伝える
  }
}
