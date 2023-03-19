import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';

import 'components.dart';
import 'components/account_setup.dart';
import 'providers.dart';
import 'states.dart';
import 'usecase/sign_up_usecase.dart';

class Onboard extends HookConsumerWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final index = useState<int>(1);
    final isForwardEnabled = useState<bool>(false);
    const steps = [
      AccountSetupStatus(index: 1, message: onboardEmailMessage),
      AccountSetupStatus(index: 2, message: onboardCalendarMessage),
    ];

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 24),
              Header(
                index.value,
                width: min(size.width - 48, 448),
                steps: steps,
              ),
              if (index.value == 1)
                EmailInput(
                  width: min(size.width - 48, 548),
                  onNameCompleted: (name) {
                    if (name == null) {
                      ref.watch(accountStatusProvider.notifier).update(
                            (s) => s.copyWith(nickName: ''),
                          );
                      isForwardEnabled.value = false;
                      return;
                    }
                    ref.watch(accountStatusProvider.notifier).update(
                          (s) => s.copyWith(nickName: name),
                        );
                    final email = ref.watch(accountStatusProvider).email;
                    if (email != '') {
                      isForwardEnabled.value = true;
                    } else {
                      isForwardEnabled.value = false;
                    }
                  },
                  onEmailCompleted: (email) {
                    if (email == null) {
                      ref.watch(accountStatusProvider.notifier).update(
                            (s) => s.copyWith(email: ''),
                          );
                      isForwardEnabled.value = false;
                      return;
                    }
                    ref.watch(accountStatusProvider.notifier).update(
                          (s) => s.copyWith(email: email),
                        );
                    final name = ref.watch(accountStatusProvider).nickName;
                    if (name != '') {
                      isForwardEnabled.value = true;
                    } else {
                      isForwardEnabled.value = false;
                    }
                  },
                ),
              if (index.value == 2)
                CalendarLinkage(
                  width: min(size.width - 48, 548),
                  onCompleted: (calendar) {
                    if (calendar.hasAtLeastOne) {
                      isForwardEnabled.value = true;
                    } else {
                      isForwardEnabled.value = false;
                    }
                  },
                ),
              Container(height: 24),
              Bottom(
                index.value,
                width: min(size.width - 48, 548),
                goBack: () {
                  index.value -= 1;
                  isForwardEnabled.value = true;
                },
                goForward: () {
                  index.value += 1;
                  isForwardEnabled.value = false;
                },
                isForwardEnabled: isForwardEnabled.value,
                createAccount: () async {
                  // create account
                  await ref.read(signUpUsecaseProvider).start();

                  // await ref
                  //       .read(authenticationManageUsecaseProvider)
                  //       .startSignup();
                },
              ),
              Container(height: 72),
            ],
          ),
        ),
      ),
    );
  }
}
