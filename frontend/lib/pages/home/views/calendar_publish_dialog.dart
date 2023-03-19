import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/utils/ui_components.dart';

import 'components/calendar_publish_dialog_provider.dart';

class CalendarPublishDialog extends HookConsumerWidget {
  const CalendarPublishDialog({super.key});

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
          Column(
            children: [
              SizedBox(
                height: 60,
                child: Text(
                  'Please select the team \n'
                  'to which you would like to publish.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Container(height: 12),
              SelectPublishTeams(height - 72),
            ],
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              width: 212,
              height: 32,
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  SecondaryButton(
                    text: 'Cancel',
                    width: 100,
                    isSmall: true,
                    onPressed: () async {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  Container(width: 12),
                  PrimaryButton(
                    text: 'Confirm',
                    width: 100,
                    isSmall: true,
                    onPressed: () async {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
