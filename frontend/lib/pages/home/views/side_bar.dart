import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/global/providers.dart';

import 'components/side_bar_components.dart';

class SideBar extends HookConsumerWidget {
  const SideBar(this.scaffoldKey, {super.key});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: height,
          width: sidebarWidth,
          color: Theme.of(context).canvasColor,
          child: Column(
            children: [
              Visibility(
                visible: scaffoldKey != null,
                child: Container(height: 60),
              ),
              Container(
                height: 280,
                alignment: Alignment.topCenter,
                child: const MonthlyCalendar(),
              ),
              SizedBox(
                height: height - 412,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      EventFilter(),
                      TeamMembers(),
                      SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          height: 120,
          child: AccountArea(
            currentUser: ref.watch(userAccountProvider),
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: Visibility(
            visible: scaffoldKey != null,
            child: IconButton(
              splashRadius: 24,
              iconSize: 36,
              onPressed: () => scaffoldKey!.currentState?.closeDrawer(),
              icon: IconTheme(
                data: Theme.of(context).iconTheme,
                child: const Icon(Icons.close),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
