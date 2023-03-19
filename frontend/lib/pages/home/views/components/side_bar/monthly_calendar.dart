import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../providers.dart';

class MonthlyCalendar extends HookConsumerWidget {
  const MonthlyCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TableCalendar<void>(
        // カレンダー期間の設定
        firstDay: ref.watch(calendarViewSettingProvider).first!,
        lastDay: ref.watch(calendarViewSettingProvider).last!,
        focusedDay:
            ref.watch(calendarViewSettingProvider.select((v) => v.focused!)),
        currentDay: DateTime.now(),
        // カレンダーの見た目・ジェスチャーの設定
        rowHeight: 36,
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        availableGestures: AvailableGestures.none,
        calendarStyle: CalendarStyle(
          defaultTextStyle: Theme.of(context).textTheme.bodySmall!,
          holidayTextStyle: Theme.of(context).textTheme.bodySmall!,
          weekendTextStyle: Theme.of(context).textTheme.bodySmall!,
          outsideTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
              ),
          todayDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: Theme.of(context).textTheme.bodySmall!,
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextStyle: Theme.of(context).textTheme.bodyMedium!,
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: Theme.of(context).textTheme.labelSmall!,
          weekendStyle: Theme.of(context).textTheme.labelSmall!,
        ),
        // 日付の選択
        selectedDayPredicate: (day) => isSameDay(
          day,
          ref.watch(calendarViewSettingProvider).focused,
        ),
        onDaySelected: (selectedDay, focusedDay) {
          ref.read(calendarViewSettingProvider.notifier).update(
                (state) => state.copyWith(focused: focusedDay),
              );
          ref
            ..read(calendarControllerProvider).displayDate = selectedDay
            ..read(calendarControllerProvider).selectedDate = selectedDay;
        },
      ),
    );
  }
}
