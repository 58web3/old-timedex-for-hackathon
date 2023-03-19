import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/ui.dart';

import 'components/side_bar_components.dart';

class SideBar extends HookConsumerWidget {
  const SideBar(
    this.scaffoldKey, {
    required this.contents,
    super.key,
  });

  final SettingContentType contents;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Visibility(
          visible: scaffoldKey != null,
          child: SizedBox(
            height: 40,
            width: sidebarWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  splashRadius: 18,
                  iconSize: 36,
                  onPressed: () => context.goNamed('home'),
                  icon: IconTheme(
                    data: Theme.of(context).iconTheme,
                    child: const Icon(Icons.home),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: IconButton(
                    splashRadius: 18,
                    iconSize: 36,
                    onPressed: () => scaffoldKey!.currentState?.closeDrawer(),
                    icon: IconTheme(
                      data: Theme.of(context).iconTheme,
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          child: SizedBox(
            height: scaffoldKey != null ? height - 40 : height - 60,
            width: sidebarWidth,
            child: Material(
              color: Theme.of(context).canvasColor,
              child: ListView(
                shrinkWrap: true,
                children: SettingContentType.values
                    .map((type) => NavigatorTile(type, type == contents))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
