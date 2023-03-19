import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/ui.dart';

import '../providers.dart';
import 'components/contents_manage_team_components.dart';

class ContentsManageTeam extends HookConsumerWidget {
  const ContentsManageTeam({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final breakpoint = ResponsiveBreakpoint.values.from(size.width);

    if (breakpoint.isDesktop) {
      return Container(
        alignment: Alignment.topCenter,
        width: size.width - sidebarWidth,
        child: SizedBox(
          width: 800,
          child: mainContents(ref, 800),
        ),
      );
    } else if (breakpoint.isTablet) {
      return SizedBox(
        width: size.width - sidebarWidth,
        child: SizedBox(
          width: min(800, size.width - sidebarWidth),
          child: mainContents(
            ref,
            min(800, size.width - sidebarWidth),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: size.width,
        child: mainContents(
          ref,
          size.width,
        ),
      );
    }
  }

  Widget mainContents(WidgetRef ref, double width) {
    if (ref.watch(teamIdsProvider).isEmpty) {
      return MainContentsInitialized(width: width);
    } else {
      return MainContents(width: width);
    }
  }
}
