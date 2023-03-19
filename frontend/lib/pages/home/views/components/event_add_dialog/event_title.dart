import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/utils/ui_components.dart';

import '../../../providers.dart';

class EventTitle extends HookConsumerWidget {
  const EventTitle({this.width = 250, super.key});
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const SizedBox(width: 36),
        SizedBox(
          width: width - 48,
          child: PrimaryTextForm(
            isDense: false,
            hint: homeDialogTitleHint,
            onValidate: (text) {
              if (text == null || text.isEmpty) {
                return eventTitleEmpty;
              }
              return null;
            },
            onEdited: (text) {
              if (text == null) {
                return;
              }
              ref.read(addEventProvider.notifier).update(
                    (state) => state.copyWith(title: text),
                  );
            },
          ),
        ),
      ],
    );
  }
}
