
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/utils/ui_components.dart';
import 'package:uuid/uuid.dart';

import '../../providers.dart';
import '../../states.dart';
import '../../usecase.dart';

class CalendarLinkage extends HookConsumerWidget {
  const CalendarLinkage({
    super.key,
    required this.width,
    required this.onCompleted,
  });

  final double width;
  final void Function(CalendarData) onCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late DropzoneViewController controller;
    final isGoogleRegistered = useState(false);
    final isOutlookRegistered = useState(false);
    final isHighlighted = useState(false);
    final isFileError = useState<bool>(false);

    ref.listen(calendarProvider, (prev, next) {
      onCompleted(next);
    });

    return Builder(
      builder: (context) {
        return SizedBox(
          height: 480,
          width: width,
          child: Column(
            children: [
              Container(height: 24),
              Text(
                'Select Calendar',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Container(height: 12),
              ActivationButton(
                onPressed: () async {
                  if (isGoogleRegistered.value) {
                    return;
                  } else {
                    // TODO(yodai-hi): Google連携
                    await ref.read(calendarDataUseCaseProvider).callGoogle();
                    isGoogleRegistered.value = true;
                  }
                },
                text: 'Google Calendar',
                leading: googleCalendarIcon,
                isLeadingLeft: true,
                isActivated: isGoogleRegistered.value,
                leadingSize: 36,
              ),
              Container(height: 24),
              ActivationButton(
                onPressed: () {
                  if (isOutlookRegistered.value) {
                    return;
                  } else {
                    // TODO(yodai-hi): Google連携
                    // isOutlookRegistered.value = true;
                  }
                },
                text: 'Outlook Calendar',
                leading: outlookCalendarIcon,
                isLeadingLeft: true,
                isActivated: isOutlookRegistered.value,
                leadingSize: 36,
              ),
              Container(height: 24),
              SizedBox(
                width: 356,
                height: 24,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: width,
                      height: 1,
                      color: Theme.of(context).dividerColor,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      color: Theme.of(context).colorScheme.background,
                      child: Text(
                        'or upload .ics',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 12),
              Container(
                width: 356,
                height: 108,
                color: isHighlighted.value
                    ? Theme.of(context).canvasColor
                    : Colors.transparent,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    DottedBorder(
                      color: Theme.of(context).colorScheme.outline,
                      dashPattern: const [15.0, 6.0],
                      strokeWidth: 3, // 点線の厚み
                      child: Container(
                        alignment: Alignment.center,
                        width: 356,
                        height: 108,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'upload .ics file here',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                        if (isFileError.value)
                          Text(
                            'this file is not supported',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          ),
                      ],
                    ),
                    DropzoneView(
                      operation: DragOperation.copy,
                      cursor: CursorType.grab,
                      onCreated: (ctrl) => controller = ctrl,
                      onHover: () => isHighlighted.value = true,
                      onLeave: () => isHighlighted.value = false,
                      onDropMultiple: (List<dynamic>? evs) async {
                        isHighlighted.value = false;
                        if (evs == null) {
                          return;
                        }
                        for (final dynamic ev in evs) {
                          await getCalendar(ref, ev, controller, isFileError);
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(height: 12),
              SizedBox(
                width: 356,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ref
                        .watch(calendarProvider.select((v) => v.icalendar))
                        .map((cal) => icalImportedChip(cal, ref, context))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget icalImportedChip(
    ICalendarData calendar,
    WidgetRef ref,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InputChip(
        padding: const EdgeInsets.all(2),
        label: Text(
          calendar.name,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        onDeleted: () {
          ref.read(calendarProvider.notifier).update(
                (s) => s.copyWith(
                  icalendar: [...s.icalendar]
                      .where((c) => c.id != calendar.id)
                      .toList(),
                ),
              );
        },
      ),
    );
  }

  Future<void> getCalendar(
    WidgetRef ref,
    dynamic ev,
    DropzoneViewController dropController,
    ValueNotifier<bool> isFileError,
  ) async {
    const mimes = ['text/calendar'];

    final mime = await dropController.getFileMIME(ev);
    if (mimes.contains(mime)) {
      isFileError.value = false;
      final data = await dropController.getFileData(ev);
      final fileData = String.fromCharCodes(data.toList());
      final calendar = ICalendarData(
        id: const Uuid().v4(),
        name: await dropController.getFilename(ev),
        file: fileData,
      );
      await ref.read(calendarDataUseCaseProvider).callIcal(calendar);
    } else {
      isFileError.value = true;
    }
  }
}
