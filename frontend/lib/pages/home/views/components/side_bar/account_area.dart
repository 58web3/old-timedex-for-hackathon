import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/global/models.dart';
import 'package:time_dex/global/providers.dart';

import '../../../providers.dart';
import 'account_tile.dart';

class AccountArea extends HookConsumerWidget {
  const AccountArea({super.key, required this.currentUser});

  final AccountState? currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 5,
      color: Theme.of(context).canvasColor,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: sidebarWidth,
        height: 120,
        child: Column(
          children: [
            Container(height: 12),
            Row(
              children: [
                const SizedBox(
                  width: 56,
                  child: Center(child: Icon(Icons.groups_2)),
                ),
                Visibility(
                  visible: ref.watch(joiningTeamsProvider).isNotEmpty,
                  child: SizedBox(
                    height: 28,
                    child: DropdownButton<String>(
                      focusColor: Colors.transparent,
                      underline: Container(),
                      style: Theme.of(context).textTheme.labelMedium,
                      alignment: Alignment.center,
                      items: ref
                          .watch(joiningTeamsProvider)
                          .map(
                            (team) => DropdownMenuItem(
                              value: team.teamId,
                              child: Text(
                                team.teamName!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          )
                          .toList(),
                      value: ref.watch(selectedTeamIdProvider),
                      onChanged: (String? teamId) {
                        if (teamId != null) {
                          ref
                              .watch(selectedTeamIdProvider.notifier)
                              .update((state) => teamId);
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: ref.watch(joiningTeamsProvider).isEmpty,
                  child: TextButton(
                    onPressed: () {
                      context.push('/setting/team');
                    },
                    child: Text(
                      'Let\'s start with new team!',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                if (currentUser != null)
                  AccountTile(
                    account: currentUser!,
                    isColorEnabled: false,
                  ),
                IconButton(
                  splashRadius: 36,
                  iconSize: 36,
                  onPressed: () => context.push('/setting/user'),
                  icon: IconTheme(
                    data: Theme.of(context).iconTheme,
                    child: const Icon(Icons.settings),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
