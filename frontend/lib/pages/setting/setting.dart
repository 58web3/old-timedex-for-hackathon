import 'package:flutter/material.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/ui.dart';

import 'components.dart';
import 'usecase.dart';

class Setting extends HookConsumerWidget {
  Setting({
    super.key,
    required this.contents,
  });

  final SettingContentType contents;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final breakpoint = ResponsiveBreakpoint.values.from(size.width);
    final teamUc = ref.watch(teamInfoUseCaseProvider);

    useEffectOnce(() {
      Future.microtask(() async => teamUc.fetchTeam());
      // TODO(yodai-hi): 疎通が出来次第データ取得を反映
      // Future.microtask(
      //   () async =>
      //       ref.watch(delegationUsecaseProvider).fetchDelegationStatus(),
      // );

      return;
    });

    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(
        context,
        isMobile: breakpoint.isMobile,
        scaffoldKey: _scaffoldKey,
      ),
      drawer: breakpoint.isMobile
          ? SizedBox(
              width: sidebarWidth,
              child: Drawer(
                child: SideBar(_scaffoldKey, contents: contents),
              ),
            )
          : null,
      body: Row(
        children: [
          if (!breakpoint.isMobile) SideBar(null, contents: contents),
          mainContents(ref),
        ],
      ),
    );
  }

  Widget mainContents(WidgetRef ref) {
    return Builder(
      builder: (context) {
        late Widget main;
        switch (contents) {
          case SettingContentType.user:
            main = const ContentsUserSetting();
            break;
          case SettingContentType.team:
            main = const ContentsManageTeam();
            break;
          case SettingContentType.calendar:
            main = const ContentsImportExternalCalendars();
            break;
          case SettingContentType.delegation:
            main = const ContentsManageDelegation();
            break;
        }

        return main;
      },
    );
  }
}
