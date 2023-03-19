import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_dex/global/models.dart';

import '../providers.dart';

// Eventに追加するユーザを保持
final addedGuests = Provider<List<AccountState>>(
  (ref) => [],
  // ref.watch(addEventProvider.select(emails))でWAベースのユーザ検索
);

// 追加するEventのStateを保持
final addEventProvider = StateProvider<CalendarEventDetail>(
  (ref) => CalendarEventDetail(
    start: ref.watch(calendarViewSettingProvider).focused,
    end: ref.watch(calendarViewSettingProvider).focused?.add(
          const Duration(hours: 1),
        ),
  ),
);

// 更新するEventのStateを保持
final updateEventProvider = StateProvider<CalendarEventDetail?>((ref) => null);

// 削除するEventのIdを保持
final deleteEventProvider = StateProvider<String?>((ref) => null);

// カレンダーを作成するユーザ(Delegationも含めて確認)
final selectedAccountProvider = StateProvider<AccountState>(
  (_) => const AccountState(),
);

// UserのカレンダーIdを保持
final userCalendarIdProvider = StateProvider<String>((ref) => '');

// Publish先のチームを保持
final publishTeamIdProvider = StateProvider<Set<String>>((ref) => {});
