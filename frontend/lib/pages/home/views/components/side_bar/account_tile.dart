import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/global/models.dart';
import 'package:time_dex/utils/ui_components.dart';


class AccountTile extends HookWidget {
  const AccountTile({
    super.key,
    required this.account,
    required this.isColorEnabled,
  });

  final AccountState account;
  final bool isColorEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sidebarWidth - 80,
      child: Row(
        children: [
          IconClipper(
            account.profileUrl,
            border: isColorEnabled ? account.background! : null,
          ),
          const SizedBox(width: 8),
          Container(
            width: sidebarWidth - 160,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  account.accountName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                CopyableText(account.email),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
