import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui/ui_message.dart';

import '../../../providers.dart';

class CalendarNavigator extends HookConsumerWidget {
  const CalendarNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconButton(
          splashRadius: 12,
          iconSize: 12,
          onPressed: () {
            // カレンダーの前の週に移動
            final ctr = ref.watch(calendarControllerProvider);
            ctr.backward!();
          },
          icon: IconTheme(
            data: Theme.of(context).iconTheme.copyWith(size: 12),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.all(4),
          ),
          onPressed: () {
            // カレンダーのカーソルを今日に移動
            final ctr = ref.watch(calendarControllerProvider);
            final now = DateTime.now();
            ctr
              ..displayDate = now
              ..selectedDate = now;
          },
          child: Text(
            homeHeaderTodayButton,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        IconButton(
          splashRadius: 12,
          iconSize: 12,
          onPressed: () {
            // カレンダーの次の週に移動
            final ctr = ref.watch(calendarControllerProvider);
            ctr.forward!();
          },
          icon: IconTheme(
            data: Theme.of(context).iconTheme.copyWith(size: 12),
            child: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ),
      ],
    );
  }
}
