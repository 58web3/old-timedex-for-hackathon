import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_dex/global/models.dart';

import '../states.dart';

// Teamの追加
final addTeamInfoProvider = StateProvider<AddTeam>(
  (_) => const AddTeam(),
);

// Teamの更新
final updateMemberWalletAddressProvider = StateProvider<Set<String>>(
  (_) => {},
);

final addMemberProfileBufferProvider =
    StateProvider.family<AccountState?, String>(
  (_, walletAddress) => null,
);

final updateNameWalletAddressProvider = StateProvider<String?>(
  (_) => null,
);

final updateDescriptionWalletAddressProvider = StateProvider<String?>(
  (_) => null,
);

// 所属している全チーム
final teamIdsProvider = StateProvider<List<String>>(
  (ref) => [],
);

// 各チームの詳細情報
final teamDataProvider = StateProvider.family<TeamInfo?, String>(
  (ref, teamId) => null,
);
