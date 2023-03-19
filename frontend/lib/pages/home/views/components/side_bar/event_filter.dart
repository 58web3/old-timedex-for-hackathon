import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/ui/ui_message.dart';

import '../../../providers.dart';

class EventFilter extends HookConsumerWidget {
  const EventFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: IconTheme(
          data: Theme.of(context).iconTheme,
          child: const Icon(Icons.calendar_month),
        ),
        title: Text(
          homeSidebarEventFilterTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        collapsedTextColor: Theme.of(context).textTheme.bodyLarge?.color,
        children: EventFilterType.values
            .map(
              (type) => filterItem(type, ref),
            )
            .toList(),
      ),
    );
  }

  Widget filterItem(EventFilterType type, WidgetRef ref) {
    final flag = ref.watch(selectedEventFilterProvider).contains(type);
    final context = useContext();
    return Row(
      children: [
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Checkbox(
            activeColor: Theme.of(context).colorScheme.primary,
            value: flag,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            onChanged: (_) {
              ref.read(selectedEventFilterProvider.notifier).update(
                    (s) => flag ? {...s..remove(type)} : {...s..add(type)},
                  );
            },
          ),
        ),
        Text(type.label),
      ],
    );
  }
}
