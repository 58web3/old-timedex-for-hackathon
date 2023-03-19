import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:time_dex/global/models.dart';

final currentUserWalletProvider = StateProvider<String?>((ref) => null);

final currentUserProvider = StateProvider<User?>((ref) => null);

final userAccountProvider = StateProvider<AccountState?>(
  (ref) {
    final user = ref.watch(currentUserProvider);
    final wallet = ref.watch(currentUserWalletProvider);

    if (user == null || wallet == null) {
      return null;
    }

    return AccountState.fromUser(user, wallet);
  },
);


final joiningTeamsProvider = StateProvider<List<TeamDetail>>((ref) => []);

final wcConnectState = StateProvider<WalletConnectRequestState>(
  (ref) => const WalletConnectRequestState(),
);
