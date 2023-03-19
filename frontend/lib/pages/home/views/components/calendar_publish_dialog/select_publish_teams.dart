import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:time_dex/global/providers.dart';

import '../../../providers.dart';

class SelectPublishTeams extends HookConsumerWidget {
  const SelectPublishTeams(this.height, {super.key});
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: ref
              .watch(joiningTeamsProvider)
              .map((team) => filterItem(team, ref))
              .toList(),
        ),
      ),
    );
  }

  Widget filterItem(TeamDetail team, WidgetRef ref) {
    final flag = ref.watch(publishTeamIdProvider).contains(team.teamId);
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
              ref.read(publishTeamIdProvider.notifier).update(
                    (s) => flag
                        ? {...s..remove(team.teamId)}
                        : {...s..add(team.teamId!)},
                  );
            },
          ),
        ),
        const SizedBox(width: 12),
        Text(team.teamName ?? ''),
      ],
    );
  }
}
