import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/global/providers.dart';
import 'package:time_dex/global/usecases.dart';
import 'package:time_dex/utils/ui_components.dart';

class Signup extends HookConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: 96),
              Image.asset(appIcon, width: 284),
              Container(height: 12),
              Text(
                appName,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Container(height: 48),
              PrimaryButton(
                text: '',
                leading: metamaskIcon,
                leadingHeight: 68,
                onPressed: () async {
                  await ref.watch(web3ConnectUsecaseProvider).connectProvider();
                  final walletAddress = ref.read(wcConnectState).currentAddress;
                  final nextPath = await ref
                      .read(authenticationManageUsecaseProvider)
                      .startAuth(walletAddress);
                  context.goNamed(nextPath);
                },
              ),
              Container(height: 48),
              SecondaryButton(
                text: signupWalletConnect,
                onPressed: () async {
                  await ref.watch(web3ConnectUsecaseProvider).connectWallet();
                  final walletAddress = ref.read(wcConnectState).currentAddress;
                  final nextPath = await ref
                      .read(authenticationManageUsecaseProvider)
                      .startAuth(walletAddress);
                  context.goNamed(nextPath);
                },
                leading: wcIcon,
              ),
                            Container(height: 12),
              Visibility(
                visible:
                    ref.watch(wcConnectState.select((v) => v.currentAddress)) !=
                        '',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InputChip(
                    padding: const EdgeInsets.all(2),
                    label: Text(
                      ref.watch(wcConnectState).currentAddress,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    onDeleted: () async {
                      await ref
                          .read(web3ConnectUsecaseProvider)
                          .disconnectWallet();
                    },
                  ),
                ),
              ),
              Container(height: 96),
            ],
          ),
        ),
      ),
    );
  }
}
