// メインのカレンダーのControllerを提供
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/global/models.dart';
import 'package:time_dex/global/providers.dart';

import '../state.dart';

final calendarControllerProvider = Provider<CalendarController>(
  (_) => CalendarController(),
);

// カレンダーの年月表示に利用
final calendarSelectedDateProvider = StateProvider<DateTime>(
  (_) => DateTime.now(),
);

// 表示するEventのPriorityでフィルター
final selectedEventFilterProvider = StateProvider<Set<EventFilterType>>(
  (_) => EventFilterType.values.toSet(),
);

// カレンダーを表示するメンバーのでフィルター
final selectedAccountsProvider = StateProvider<List<AccountState>>(
  (_) => [],
);

// カレンダーを表示するメンバーのでフィルター
final selectedTeamIdProvider = StateProvider<String>(
  (_) => '',
);


// カレンダーのモードを切り替え
final calendarModeProvider = StateProvider<CalendarMode>(
  (_) => CalendarMode.private,
);

// カレンダーの設定
/// first->表示期間の最初(今日)
/// last->表示期間の最後(未来一年分)
/// focused->現在フォーカスしている日付・時間
final calendarViewSettingProvider = StateProvider<CalendarPreset>(
  (_) => CalendarPreset(
    first: DateTime.now(),
    last: DateTime.now().subtract(const Duration(days: -365)),
    focused: DateTime.now(),
  ),
);

// WalletAddressをKeyとして複数のカレンダーを保持
final calendarEventByUserProvider =
    StateProvider.family<List<CalendarEventDetail>, String>(
  (ref, type) => [],
);

// API連携などで取得したカレンダー
final userCalendarEventByTypeProvider =
    StateProvider<List<CalendarEventDetail>>((ref) {
  return [];
});

// 現在カレンダーに表示するEvent
final calendarEventProvider = StateProvider<List<CalendarEvent>>(
  (ref) {
    late List<CalendarEvent> allEvents;
    if (ref.watch(calendarModeProvider).isPrivate) {
      allEvents = ref
          .watch(userCalendarEventByTypeProvider)
          .map(
            (e) => CalendarEvent(
              detail: e,
              background:
                  ref.watch(userAccountProvider)?.background ?? Colors.grey,
            ),
          )
          .toList();
    } else {
      // チームメンバーのカレンダーを結合させて表示
      allEvents = ref
          .watch(selectedAccountsProvider)
          .map(
            (a) => ref.watch(calendarEventByUserProvider(a.walletAddress)).map(
                  (e) => CalendarEvent(detail: e, background: a.background!),
                ),
          )
          .expand((l) => l)
          .toList();
    }

    final filter = ref.watch(selectedEventFilterProvider);

    return allEvents.where((e) => filter.contains(e.detail.priority)).toList();
  },
);
