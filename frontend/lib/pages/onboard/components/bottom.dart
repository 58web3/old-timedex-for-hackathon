import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/utils/ui_components.dart';

class Bottom extends StatelessWidget {
  const Bottom(
    this.currentIndex, {
    super.key,
    required this.width,
    required this.goBack,
    required this.goForward,
    required this.isForwardEnabled,
    required this.createAccount,
  });
  final int currentIndex;
  final double width;
  final VoidCallback goBack;
  final VoidCallback goForward;
  final bool isForwardEnabled;
  final Future<void> Function() createAccount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DisableButton(
            width: 200,
            height: 40,
            text: currentIndex == 1 ? buttonCancel : buttonBack,
            onPressed: () {
              if (currentIndex == 1) {
                context.goNamed('signup');
              } else {
                goBack();
              }
            },
          ),
          PrimaryButton(
            width: 200,
            height: 40,
            text: currentIndex == 2 ? buttonFinish : buttonNext,
            onPressed: isForwardEnabled
                ? () async {
                    if (currentIndex == 2) {
                      await createAccount();
                      context.goNamed('home');
                    } else {
                      goForward();
                    }
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
