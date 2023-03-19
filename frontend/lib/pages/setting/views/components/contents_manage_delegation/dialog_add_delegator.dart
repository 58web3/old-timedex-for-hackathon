import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/ui.dart';

import '../../../providers.dart';
import '../../../usecase.dart';
import '../contents_manage_team_components.dart';

class DialogAddDelegator extends HookConsumerWidget {
  const DialogAddDelegator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final breakpoint = ResponsiveBreakpoint.values.from(size.width);

    final screenWidth =
        breakpoint.isMobile ? size.width - 24 : size.width - sidebarWidth;
    final screenHeight = size.height;
    final width = min(500, screenWidth - 24).toDouble();

    return Padding(
      padding: EdgeInsets.only(
        left: breakpoint.isMobile ? 0 : sidebarWidth,
      ),
      child: Stack(
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
      ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: 12),
                TeamDialogMember(
                  width: width - 48,
                  walletAddresses: ref.watch(addDelegatorWalletAddressProvider),
                  onEdited: (wa) {
                    ref
                        .read(addDelegatorWalletAddressProvider.notifier)
                        .update((state) => {...state, wa});
                  },
                  onDelete: (wa) {
                    ref.read(addDelegatorWalletAddressProvider.notifier).update(
                          (s) => {...s}.where((v) => v != wa).toSet(),
                        );
                  },
                ),
                const SizedBox(height: 54),
              ],
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
                onPressed: () async {
                  // delegateのリクエストを発行
                  await ref
                      .read(delegationUsecaseProvider)
                      .delegateToTeamMember(
                        ref.read(addDelegatorWalletAddressProvider).toList(),
                      );
                  Navigator.of(context).pop();
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
