import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/utils/ui_components.dart';

import '../../../providers.dart';
import '../../../states.dart';
import '../../../usecase.dart';
import '../contents_manage_delegation.dart';

class ContentsDelegateTo extends HookConsumerWidget {
  const ContentsDelegateTo({required this.width, super.key});

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: min(width, 600),
      height: height / 2 - 32,
      child: Column(
        children: [
          Container(height: 24),
          Container(
            height: 48,
            color: Theme.of(context).canvasColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Delegated to',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    splashRadius: 18,
                    onPressed: () async {
                      await showDialog<void>(
                        context: context,
                        barrierColor: Colors.transparent,
                        barrierDismissible: false,
                        builder: (_) {
                          return const DialogAddDelegator();
                        },
                      );
                    },
                    icon: IconTheme(
                      data: Theme.of(context).iconTheme,
                      child: const Icon(Icons.group_add),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height / 2 - 132,
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: SingleChildScrollView(
              child: Column(
                children: ref
                    .watch(delegatedToMemberProvider)
                    .map((info) => memberInfo(info, ref))
                    .toList(),
              ),
            ),
          ),
          Container(height: 24),
        ],
      ),
    );
  }

  Widget memberInfo(DelegationInfo info, WidgetRef ref) {
    final context = useContext();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          IconClipper(
            size: 36,
            info.profileUrl == ''
                ? 'https://wallpapercave.com/wp/wp8846945.jpg'
                : info.profileUrl,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(info.name),
          ),
          Expanded(
            flex: 2,
            child: Text(info.email),
          ),
          SizedBox(
            width: 36,
            height: 36,
            child: IconButton(
              splashRadius: 18,
              onPressed: () async {
                // TODO(yodai-hi): Delegateしているユーザを削除
                await ref
                    .read(delegationUsecaseProvider)
                    .deleteFromDelegationMembers(info.walletAddress);

                // Localでも削除
                ref.read(delegatedToMemberProvider.notifier).update(
                      (state) => [...state]
                          .where((s) => s.walletAddress != info.walletAddress)
                          .toList(),
                    );
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
}
