import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/global/models.dart';

import '../../../providers.dart';
import '../../../states/appointment.dart';
import '../../event_add_dialog.dart';
import 'priority_dialog.dart';

class MainCalendar extends HookConsumerWidget {
  const MainCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SfCalendar(
        // 見た目の設定
        cellBorderColor: Theme.of(context).dividerColor,
        headerHeight: 0,
        viewHeaderHeight: 64,
        viewHeaderStyle: ViewHeaderStyle(
          dateTextStyle: textTheme.bodyLarge,
          dayTextStyle: textTheme.bodySmall,
        ),
        todayTextStyle: textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
        blackoutDatesTextStyle: textTheme.bodyLarge,
        timeSlotViewSettings: TimeSlotViewSettings(
          nonWorkingDays: const [],
          timeFormat: 'HH:mm',
          timeTextStyle: Theme.of(context).textTheme.labelMedium,
          dateFormat: 'dd',
          dayFormat: 'EEE',
        ),
        view: CalendarView.workWeek,
        // カレンダー期間の設定
        // TODO(yodai-hi): 過去1年分は閲覧だけ可能にする
        minDate: ref.watch(calendarViewSettingProvider).first,
        maxDate: ref.watch(calendarViewSettingProvider).last,
        initialSelectedDate: ref.watch(calendarViewSettingProvider).focused,
        controller: ref.watch(calendarControllerProvider),
        // 機能の表示設定

        onViewChanged: (detail) {
          // カレンダーの週を移動した時に
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(calendarSelectedDateProvider.notifier).update(
                  (state) => detail.visibleDates.first,
                );
          });
        },
        onTap: (detail) async {
          if (detail.targetElement == CalendarElement.calendarCell) {
            final target = detail.date ?? DateTime.now();

            ref
              ..read(calendarSelectedDateProvider.notifier)
                  .update((_) => target)
              ..read(calendarViewSettingProvider.notifier).update(
                (state) => state.copyWith(focused: target),
              );
            await showDialog<void>(
              context: context,
              // barrierColor: Colors.transparent,
              barrierDismissible: false,
              builder: (_) {
                return const EventAddDialog();
              },
            );
          }
          if (detail.appointments?.isNotEmpty ?? false) {}
        },
        onLongPress: (detail) async {
          if (detail.appointments?.isNotEmpty ?? false) {
            final appoint = detail.appointments!.first as CalendarEvent;
            final eventId = appoint.detail.id;

            final res = await showDialog<EventFilterType?>(
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (_) {
                    return PriorityDialog(appoint.detail.priority);
                  },
                ) ??
                appoint.detail.priority;

            if (res == appoint.detail.priority) {
              return;
            }

            ref.watch(userCalendarEventByTypeProvider.notifier).update(
                  (state) => [
                    ...state.where((event) => event.id != eventId),
                    state
                        .where((event) => event.id == eventId)
                        .first
                        .copyWith(priority: res),
                  ],
                );
          }
        },
        // 予定の追加，変更，予定の確度変更
        dataSource: EventDataSource(
          ref.watch(calendarEventProvider),
        ),
        appointmentTextStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.black,
            ),
        // TODO(yodai-hi): 予定の追加，変更，予定の確度変更を実施
        // ドラッグによる予定変更
        // allowDragAndDrop: true,
        // allowAppointmentResize: true,
        // onAppointmentResizeEnd: (detail) {
        //   print(detail.toString());
        // },
        // onAppointmentResizeUpdate: (detail) {
        //   print(detail.toString());
        // },
        // onDragEnd: (detail) {
        //   print(detail.toString());
        // },
        // onDragUpdate: (detail) {
        //   print(detail.toString());
        // },
      ),
    );
  }
}
