import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_dex/global/models.dart';
import 'package:time_dex/global/providers.dart';

final teamIdsProvider = StateProvider<List<String>>(
  (ref) => ref.watch(currentUserProvider) == null
      ? []
      : ref.watch(currentUserProvider)!.teamsIds,
);

// TeamIdをKeyとして複数の配列を保持
// TODO(yodai-hi): API経由で取得
final teamMemberProvider =
    StateProvider.family<List<AccountState>, String>((ref, teamId) {
  return [];
});

final isNotificationReceived = StateProvider<bool>((_) => false);
