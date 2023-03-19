import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/pages/setting/views/components/contents_manage_team/dialog_update_members.dart';

import '../../../states.dart';
import 'dialog_update_team_info.dart';
import 'member_tile.dart';

class TeamAccordion extends HookConsumerWidget {
  const TeamAccordion({required this.teamInfo, required this.width, super.key});
  final TeamInfo teamInfo;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpand = useState(false);

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: ExpansionTile(
          collapsedTextColor: Theme.of(context).textTheme.bodyLarge?.color,
          textColor: Theme.of(context).textTheme.bodyLarge?.color,
          collapsedBackgroundColor: Theme.of(context).canvasColor,
          iconColor: Theme.of(context).iconTheme.color,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width - 208,
                child: Text(
                  teamInfo.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ),
              IconButton(
                splashRadius: 18,
                icon: IconTheme(
                  data: Theme.of(context).iconTheme,
                  child: const Icon(Icons.person_add),
                ),
                onPressed: isExpand.value
                    ? () async {
                        await showDialog<void>(
                          context: context,
                          barrierColor: Colors.transparent,
                          barrierDismissible: false,
                          builder: (_) {
                            return DialogUpdateMembers(teamInfo.id);
                          },
                        );
                      }
                    : null,
              ),
            ],
          ),
          leading: IconButton(
            splashRadius: 18,
            icon: IconTheme(
              data: Theme.of(context).iconTheme,
              child: const Icon(Icons.edit),
            ),
            onPressed: isExpand.value
                ? () async {
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return DialogUpdateTeamInfo(teamInfo.id);
                      },
                    );
                  }
                : null,
          ),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Text(
                teamInfo.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      overflow: TextOverflow.visible,
                    ),
              ),
            ),
            ...teamInfo.members.map(MemberTile.new),
          ],
          onExpansionChanged: (value) => isExpand.value = value,
        ),
      ),
    );
  }
}
