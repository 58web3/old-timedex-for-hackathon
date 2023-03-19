import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/utils/ui_components.dart';


class TeamDialogMember extends HookConsumerWidget {
  const TeamDialogMember({
    this.width = 250,
    required this.walletAddresses,
    required this.onEdited,
    required this.onDelete,
    super.key,
  });
  final double width;
  final Set<String> walletAddresses;
  final void Function(String) onEdited;
  final void Function(String) onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: width - 48,
          child: PrimaryTextForm(
            hint: settingTeamDialogMemberHint,
            isClear: true,
            isDense: false,
            isTapOutside: false,
            // onValidate: (value) {
            //   if (value == null || value.isEmpty) {
            //     return null;
            //   }
            //   final walletAddressValid = RegExp(
            //     walletAddressValidator,
            //   ).hasMatch(value);

            //   if (ref.watch(teamDataProvider(value)) == null) {
            //     return notExistedWalletAddress;
            //   }

            //   if (walletAddressValid) {
            //     return null;
            //   }

            //   return invalidWalletAddress;
            // },
            // onAsyncTask: (value) async {
            //   await ref.read(teamInfoUseCaseProvider).checkUserAccount(value);
            // },
            onEdited: (walletAddress) async {
              if (walletAddress != null && walletAddress.isNotEmpty) {
                onEdited(walletAddress);
              }
            },
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 76, maxHeight: 124),
          child: SingleChildScrollView(
            child: Column(
              children: walletAddresses
                  .map(
                    (walletAddress) => guestInfo(walletAddress, context, ref),
                  )
                  .toList()
                  .reversed
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget guestInfo(
    String walletAddress,
    BuildContext context,
    WidgetRef ref,
  ) {
    return SizedBox(
      width: width - 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 16),
              Text(
                walletAddress,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          IconButton(
            splashRadius: 18,
            onPressed: () {
              onDelete(walletAddress);
            },
            icon: IconTheme(
              data: Theme.of(context).iconTheme,
              child: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
