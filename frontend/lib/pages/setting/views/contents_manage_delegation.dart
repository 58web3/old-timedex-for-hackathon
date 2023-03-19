import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/ui.dart';

import 'components/contents_manage_delegation.dart';

class ContentsManageDelegation extends HookConsumerWidget {
  const ContentsManageDelegation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final breakpoint = ResponsiveBreakpoint.values.from(size.width);

    if (breakpoint.isDesktop) {
      return Container(
        alignment: Alignment.topCenter,
        width: size.width - sidebarWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 24),
            ContentsDelegateTo(
              width: (size.width - sidebarWidth - 72) / 2,
            ),
            Container(width: 24),
            ContentsDelegateFrom(
              width: (size.width - sidebarWidth - 72) / 2,
            ),
            Container(width: 24),
          ],
        ),
      );
    } else if (breakpoint.isTablet) {
      return SizedBox(
        width: size.width - sidebarWidth,
        child: SizedBox(
          width: min(800, size.width - sidebarWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 24),
              Column(
                children: [
                  ContentsDelegateTo(
                    width: min(800, size.width - sidebarWidth) - 48,
                  ),
                  ContentsDelegateFrom(
                    width: min(800, size.width - sidebarWidth) - 48,
                  ),
                ],
              ),
              Container(width: 24),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 24),
            Column(
              children: [
                ContentsDelegateTo(width: size.width - 48),
                ContentsDelegateFrom(width: size.width - 48),
              ],
            ),
            Container(width: 24),
          ],
        ),
      );
    }
  }
}
