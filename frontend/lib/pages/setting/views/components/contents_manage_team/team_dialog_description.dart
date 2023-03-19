import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/utils/ui_components.dart';

class TeamDialogDescription extends HookConsumerWidget {
  const TeamDialogDescription({
    this.width = 250,
    required this.onEdited,
    super.key,
  });
  final double width;
  final void Function(String?) onEdited;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width - 48,
      child: PrimaryTextForm(
        isDense: false,
        hint: settingTeamDialogDescriptionHint,
        onValidate: (text) {
          if ((text?.length ?? 0) > 2048) {
            return teamDescriptionEmpty;
          }
          return null;
        },
        onEdited: onEdited,
      ),
    );
  }
}
