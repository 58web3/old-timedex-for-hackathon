import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/utils/ui_components.dart';

import '../../../providers.dart';
import '../../../states.dart';

class ContentsDelegateFrom extends HookConsumerWidget {
  const ContentsDelegateFrom({required this.width, super.key});

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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Delegated from',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                    .watch(delegatedFromMemberProvider)
                    .map(memberInfo)
                    .toList(),
              ),
            ),
          ),
          Container(height: 24),
        ],
      ),
    );
  }

  Widget memberInfo(DelegationInfo info) {
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
          const SizedBox(width: 36, height: 36)
        ],
      ),
    );
  }
}
