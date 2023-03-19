import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/utils/ui_components.dart';

import '../../../providers.dart';

class EventPriority extends HookConsumerWidget {
  const EventPriority({this.width = 250, super.key});
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconTheme(
          data: Theme.of(context).iconTheme,
          child: const Icon(Icons.check_box_outlined),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: width - 48,
          child: DropdownForm(
            items: EventFilterType.values.toList(),
            onChanged: (type) {
              if (type != null) {
                ref.read(addEventProvider.notifier).update(
                      (state) =>
                          state.copyWith(priority: type as EventFilterType),
                    );
              }
            },
          ),
        ),
      ],
    );
  }
}
