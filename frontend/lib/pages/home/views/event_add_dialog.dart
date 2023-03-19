import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';

import '../providers.dart';
import '../usecase/calendar_manage_usecase.dart';
import 'components/event_add_dialog_components.dart';

class EventAddDialog extends HookConsumerWidget {
  const EventAddDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final width = min(500, screenWidth - 24).toDouble();

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          width: screenWidth,
          height: screenHeight,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(
            width: width,
            height: 400,
            child: Column(
              children: [
                dialogHeader(width, 40),
                mainContents(width, 360, ref),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget dialogHeader(double width, double height) {
    final context = useContext();

    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerRight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: IconButton(
        splashRadius: 24,
        onPressed: () => Navigator.of(context).pop(),
        icon: IconTheme(
          data: Theme.of(context).iconTheme,
          child: const Icon(Icons.close),
        ),
      ),
    );
  }

  Widget mainContents(double width, double height, WidgetRef ref) {
    final context = useContext();

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  EventTitle(width: width - 24),
                  const SizedBox(height: 12),
                  EventTime(width: width - 24),
                  const SizedBox(height: 12),
                  EventGuests(width: width - 24),
                  const SizedBox(height: 12),
                  EventPriority(width: width - 24),
                  const SizedBox(height: 12),
                  EventDescription(width: width - 24),
                  const SizedBox(height: 54),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Material(
              elevation: 1,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Container(
                width: width,
                height: 40,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              width: 80,
              height: 32,
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(userCalendarEventByTypeProvider.notifier).update(
                        (state) => [...state, ref.read(addEventProvider)],
                      );
                  Navigator.of(context).pop();

                  ref.read(calendarManageUsecaseProvider).addEvent();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
