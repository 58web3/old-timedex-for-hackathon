import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/utils/ui_components.dart';

import '../../../states.dart';

class MemberTile extends HookConsumerWidget {
  const MemberTile(this.memberInfo, {super.key});

  final MemberInfo memberInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          IconClipper(memberInfo.profileUrl),
          const SizedBox(width: 12),
          Expanded(
            child: Text(memberInfo.name),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(child: Text(memberInfo.email)),
            ),
          ),
          SizedBox(
            width: 120,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  memberInfo.status.label,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: memberInfo.status.color,
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 36,
            height: 36,
            child: IconButton(
              onPressed: () {
                // TODO(yodai-hi): チームからメンバーを削除
              },
              icon: IconTheme(
                data: Theme.of(context).iconTheme,
                child: const Icon(Icons.delete),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _body(WidgetRef ref) {
    final context = useContext();

    return Container();
  }
}
