import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/global/models.dart';
import 'package:time_dex/utils/ui_components.dart';

import '../../../providers.dart';

class EventGuests extends HookConsumerWidget {
  const EventGuests({this.width = 250, super.key});
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            IconTheme(
              data: Theme.of(context).iconTheme,
              child: const Icon(Icons.people),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: width - 48,
              child: PrimaryTextForm(
                hint: homeDialogGuestHint,
                isClear: true,
                isDense: false,
                onValidate: (value) {
                  if (value == null) {
                    return null;
                  }
                  final walletAddressValid = RegExp(
                    walletAddressValidator,
                  ).hasMatch(value);

                  if (walletAddressValid) {
                    return null;
                  }

                  return invalidWalletAddress;
                },
                onEdited: (walletAddress) {
                  if (walletAddress == null) {
                    return;
                  }
                  ref.read(addEventProvider.notifier).update(
                        (state) => state.copyWith(
                          walletAddresses: [
                            ...state.walletAddresses,
                            walletAddress
                          ],
                        ),
                      );
                },
              ),
            ),
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 160, maxHeight: 0),
          child: SingleChildScrollView(
            child: Column(
              children: ref
                  .watch(addedGuests)
                  .map(
                    (guest) => guestInfo(guest, context, ref),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget guestInfo(
    AccountState account,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconClipper(
              account.profileUrl,
              size: 32,
            ),
            Text(
              account.email,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            // TODO(yodai-hi): ここで追加Guestから削除
            // ref.read(addedGuests.notifier).update((state) => state);
          },
          icon: IconTheme(
            data: Theme.of(context).iconTheme,
            child: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
