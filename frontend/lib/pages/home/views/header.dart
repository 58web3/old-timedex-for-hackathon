import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/utils/ui_components.dart';
import 'package:badges/badges.dart' as bg;

import '../providers.dart';
import '../usecase.dart';
import 'calendar_publish_dialog.dart';
import 'components/calendar/notification_dialog.dart';

class Header extends AppBar {
  Header(
    this.context,
    this.ref,
    this.scaffoldKey, {
    super.key,
    required this.isMobile,
    required this.controller,
    this.calendarNavigator,
  }) : super(
          elevation: 0,
          toolbarHeight: 60,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              // アプリ名の表示を画面サイズに合わせて切り替え
              Visibility(
                visible: !isMobile,
                child: Container(
                  height: 72,
                  width: sidebarWidth,
                  alignment: Alignment.center,
                  color: Theme.of(context).canvasColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Image.asset(appBlackIcon, height: 36),
                      ),
                      Text(
                        appName,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
              // カレンダーモードの切り替えスイッチ
              Container(
                width: 52,
                height: 24,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: AdvancedSwitch(
                  width: 52,
                  height: 24,
                  controller: controller,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveColor: Theme.of(context).colorScheme.secondary,
                  activeChild: const Icon(Icons.person),
                  inactiveChild: const Icon(Icons.people),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
              ),
              // カレンダーの年月表示
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  DateFormat('MMMM yyyy').format(
                    ref.watch(calendarSelectedDateProvider),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              if (calendarNavigator != null) calendarNavigator
            ],
          ),
          centerTitle: isMobile,
          leading: isMobile
              ? IconButton(
                  splashRadius: 24,
                  iconSize: 36,
                  onPressed: () => scaffoldKey.currentState?.openDrawer(),
                  icon: IconTheme(
                    data: Theme.of(context).iconTheme,
                    child: const Icon(Icons.menu),
                  ),
                )
              : null,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: bg.Badge(
                showBadge: ref.watch(isNotificationReceived),
                badgeContent: const Text(''),
                child: IconButton(
                  splashRadius: 18,
                  iconSize: 36,
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    if (ref.read(isNotificationReceived) == false) {
                      return;
                    }
                    ref
                        .read(isNotificationReceived.notifier)
                        .update((state) => false);

                    await showDialog<bool>(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return NotificationDialog(
                          onCancel: () {},
                          onConfirm: () {},
                        );
                      },
                    );
                  },
                  icon: IconTheme(
                    data: Theme.of(context).iconTheme,
                    child: const Icon(Icons.notifications),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 48),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SecondaryButton(
                text: homeCalendarPublish,
                prefix: Icons.upload,
                width: 124,
                isSmall: true,
                onPressed: () async {
                  final res = await showDialog<bool>(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const CalendarPublishDialog();
                        },
                      ) ??
                      false;

                  if (res) {
                    await ref
                        .read(calendarManageUsecaseProvider)
                        .publishCalendar();
                  }
                },
              ),
            ),
            const SizedBox(width: 24)
          ],
        ) {
    controller.value = ref.watch(calendarModeProvider).indexNum == 0;
  }

  final BuildContext context;
  final WidgetRef ref;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool isMobile;
  final Widget? calendarNavigator;
  final ValueNotifier<bool> controller;
}
