import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/pages/setting/views/components/contents_manage_team/dialog_add_team.dart';
import 'package:time_dex/utils/ui_components.dart';


class MainContentsInitialized extends HookConsumerWidget {
  const MainContentsInitialized({required this.width, super.key});

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final style = Theme.of(context).textTheme.titleMedium;
    return SizedBox(
      width: width,
      height: size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              settingTeamWelcomeOne,
              style: style,
            ),
            Text(
              settingTeamWelcomeTwo,
              style: style,
            ),
            Container(height: 36),
            SecondaryButton(
              width: 200,
              height: 40,
              onPressed: () async {
                await showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return const DialogAddTeam();
                  },
                );
              },
              text: settingTeamAddFirstTeam,
              prefix: Icons.add,
              isSmall: true,
            ),
          ],
        ),
      ),
    );
  }
}
