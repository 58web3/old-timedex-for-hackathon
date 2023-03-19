import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/utils/ui_components.dart';

class NotificationDialog extends HookConsumerWidget {
  const NotificationDialog({
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
            width: 500,
            height: 300,
            child: Column(
              children: [
                Container(height: 36),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: 
                  // RichText(
                  //   textAlign: TextAlign.center,
                  //   text: TextSpan(
                  //     style: Theme.of(context).textTheme.bodyLarge,
                  //     children: [
                  //       TextSpan(
                  //         text: homeInvitationExample1,
                  //         style: Theme.of(context).textTheme.titleSmall,
                  //       ),
                  //       const TextSpan(text: homeInvitationExample2),
                  //       const TextSpan(text: homeInvitationExample3),
                  //       const TextSpan(text: homeInvitationExample4),
                  //       const TextSpan(text: homeInvitationExample5),
                  //     ],
                  //   ),
                  // ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text: homeDelegationExample1,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const TextSpan(text: homeDelegationExample2),
                        const TextSpan(text: homeDelegationExample3),
                        const TextSpan(text: homeDelegationExample4),
                      ],
                    ),
                  ),
                ),
                Container(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SecondaryButton(
                      text: 'Cancel',
                      width: 100,
                      height: 32,
                      isSmall: true,
                      onPressed: () async {
                        onCancel();
                        Navigator.of(context).pop();
                      },
                    ),
                    Container(width: 12),
                    PrimaryButton(
                      text: 'Confirm',
                      width: 100,
                      height: 32,
                      isSmall: true,
                      onPressed: () async {
                        onConfirm();
                        Navigator.of(context).pop();
                      },
                    ),
                    Container(width: 12),
                  ],
                ),
                Container(height: 12),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
