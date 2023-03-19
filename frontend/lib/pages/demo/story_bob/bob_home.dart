import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/global/providers.dart';
import 'package:time_dex/pages/home/views/header.dart';
import 'package:time_dex/pages/home/views/side_bar.dart';

import '../../home/providers.dart';
import '../../home/views/components/calendar_components.dart';
import '../../home/views/event_add_dialog.dart';
import 'mock_data_bob.dart';

class BobHome extends HookConsumerWidget {
  BobHome({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final breakpoint = ResponsiveBreakpoint.values.from(size.width);
    final calendarModeController = ValueNotifier<bool>(
      ref.watch(calendarModeProvider).isPrivate,
    );

    useEffectOnce(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // アカウントタイル
        ref.watch(userAccountProvider.notifier).update((_) => bobAccount);
        // カレンダーの予定
        ref
            .watch(userCalendarEventByTypeProvider.notifier)
            .update((_) => bobPersonalCalendar);

        // 所属しているチーム
        ref.watch(teamIdsProvider.notifier).update((_) => bobTeamIds);

        // 選択中のチーム
        ref
            .watch(selectedTeamIdProvider.notifier)
            .update((state) => bobTeamIds.first);
        // 参加中のチームの詳細
        ref
            .watch(joiningTeamsProvider.notifier)
            .update((state) => bobJoiningTeams);
        // 選択中のチームのチームメンバー
        for (final id in bobTeamIds) {
          ref
              .watch(
                teamMemberProvider(id).notifier,
              )
              .update((_) => bobTeamMembers[id]!);
        }
        ref.watch(isNotificationReceived.notifier).update((state) => true);
        
        calendarModeController.addListener(() {
          ref.watch(calendarModeProvider.notifier).update(
                (_) => calendarModeController.value
                    ? CalendarMode.private
                    : CalendarMode.team,
              );
        });
      });

      return calendarModeController.dispose;
    });

    return Scaffold(
      key: _scaffoldKey,
      appBar: header(breakpoint, ref, calendarModeController),
      drawer: breakpoint.isMobile
          ? SizedBox(
              width: sidebarWidth,
              child: Drawer(
                child: SideBar(_scaffoldKey),
              ),
            )
          : null,
      body: Row(
        children: [
          if (!breakpoint.isMobile) const SideBar(null),
          mainContents(breakpoint, size, ref),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        hoverColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
        onPressed: () async {
          await showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return const EventAddDialog();
            },
          );
        },
      ),
    );
  }

  PreferredSizeWidget header(
    ResponsiveBreakpoint breakpoint,
    WidgetRef ref,
    ValueNotifier<bool> controller,
  ) {
    final context = useContext();
    if (breakpoint.isMobile) {
      return Header(
        context,
        ref,
        _scaffoldKey,
        isMobile: breakpoint.isMobile,
        controller: controller,
      );
    } else {
      return Header(
        context,
        ref,
        _scaffoldKey,
        isMobile: breakpoint.isMobile,
        controller: controller,
        calendarNavigator: const CalendarNavigator(),
      );
    }
  }

  Widget mainContents(
    ResponsiveBreakpoint breakpoint,
    Size size,
    WidgetRef ref,
  ) {
    if (breakpoint.isDesktop) {
      return Container(
        alignment: Alignment.topCenter,
        width: size.width - sidebarWidth,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: size.height - 96,
              width: size.width - sidebarWidth,
              child: const MainCalendar(),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    } else if (breakpoint.isTablet) {
      return SizedBox(
        width: size.width - sidebarWidth,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: size.height - 96,
              width: size.width - sidebarWidth,
              child: const MainCalendar(),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: size.width,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: CalendarNavigator(),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: size.height - 156,
              width: size.width,
              child: const MainCalendar(),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    }
  }
}
