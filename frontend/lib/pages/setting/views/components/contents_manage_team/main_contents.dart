import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/utils/ui_components.dart';

import '../../../providers.dart';
import 'dialog_add_team.dart';
import 'team_accordion.dart';

class MainContents extends HookConsumerWidget {
  const MainContents({required this.width, super.key});

  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...ref
                    .watch(teamIdsProvider)
                    .map((id) => ref.watch(teamDataProvider(id)))
                    .where((info) => info != null)
                    .map(
                      (info) => TeamAccordion(teamInfo: info!, width: width),
                    ),
                Container(height: 100),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          right: 36,
          child: AddButton(
            onPressed: () async {
              await showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return const DialogAddTeam();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
