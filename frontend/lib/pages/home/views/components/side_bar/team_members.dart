import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/global/models.dart';

import '../../../providers.dart';
import 'account_tile.dart';

class TeamMembers extends HookConsumerWidget {
  const TeamMembers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: IconTheme(
          data: Theme.of(context).iconTheme,
          child: const Icon(Icons.people),
        ),
        title: Text(
          homeSidebarTeamMemberTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        collapsedTextColor: Theme.of(context).textTheme.bodyLarge?.color,
        children: ref
            .watch(teamMemberProvider(ref.watch(selectedTeamIdProvider)))
            .map(
              (account) => memberItem(account, ref),
            )
            .toList(),
      ),
    );
  }

  Widget memberItem(AccountState account, WidgetRef ref) {
    final context = useContext();
    final isCalendarVisible = useState<bool>(true);

    return Container(
      width: sidebarWidth,
      height: 72,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AccountTile(
            account: account,
            isColorEnabled: isCalendarVisible.value,
          ),
          IconButton(
            splashRadius: 36,
            iconSize: 36,
            onPressed: () {
              isCalendarVisible.value = !isCalendarVisible.value;
              if (isCalendarVisible.value) {
                ref
                    .read(selectedAccountsProvider.notifier)
                    .update((state) => [...state, account]);
              } else {
                ref.read(selectedAccountsProvider.notifier).update(
                      (state) => state
                          .where(
                            (t) => t.walletAddress != account.walletAddress,
                          )
                          .toList(),
                    );
              }
            },
            icon: IconTheme(
              data: Theme.of(context).iconTheme,
              child: Icon(
                isCalendarVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
