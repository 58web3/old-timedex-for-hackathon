import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/utils/ui_components.dart';

class TeamDialogName extends HookConsumerWidget {
  const TeamDialogName({
    this.width = 250,
    required this.onEdited,
    super.key,
  });
  final double width;
  final void Function(String) onEdited;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width - 48,
      child: PrimaryTextForm(
        isDense: false,
        hint: settingTeamDialogNameHint,
        isTapOutside: false,
        // onValidate: (text) {
        //   if (text == null || text.isEmpty) {
        //     return teamNameEmpty;
        //   }
        //   return null;
        // },
        onEdited: (text) {
          if (text != null) {
            onEdited(text);
          }
        },
      ),
    );
  }
}
