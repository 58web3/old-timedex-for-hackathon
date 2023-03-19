import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_dex/global/models.dart';
import 'package:time_dex/global/providers.dart';
import 'package:time_dex/global/repositories.dart';
import 'package:uuid/uuid.dart';

import '../../demo/story_alice/mock_data_alice.dart';
import '../providers.dart';
import '../states.dart';

final teamInfoUseCaseProvider = Provider<TeamInfoUseCase>(
  (ref) => TeamInfoUseCase(ref: ref),
);

class TeamInfoUseCase {
  TeamInfoUseCase({
    required Ref ref,
  }) : _ref = ref;

  final Ref _ref;

  Future<void> checkUserAccount(String walletAddress) async {
    try {
      final account = _ref.read(addMemberProfileBufferProvider(walletAddress));
      if (account != null) {
        return;
      }

      final userId = await _ref
          .read(walletApiRepositoryProvider)
          .getUserIdByWalletAddress(walletAddress);
      if (userId == null) {
        throw Exception();
      }

      final user = await _ref.read(userApiRepositoryProvider).getUser(userId);

      _ref
          .read(addMemberProfileBufferProvider(walletAddress).notifier)
          .update((state) => AccountState.fromUser(user, walletAddress));
    } on Exception catch (err) {
      _ref.read(loggerProvider).e(err);
    }
  }

  Future<void> fetchTeam() async {
    final teamIds = _ref.read(currentUserProvider)?.teamsIds ?? [];
    _ref.read(teamIdsProvider.notifier).update((_) => teamIds);

    for (final teamId in teamIds) {
      // TODO(yodai-hi): ここでTeamのAPIを呼ぶ
      // TODO(yodai-hi): TeamのデータをTeamInfoに整形
      final teamData = TeamInfo();
      _ref.read(teamDataProvider(teamId).notifier).update((state) => teamData);
    }
  }

  Future<void> createTeam() async {
    // TODO(yodai-hi): DEMO
    final team = _ref.read(addTeamInfoProvider);
    final teamId = const Uuid().v4();
    _ref.watch(teamIdsProvider.notifier).update((state) => [...state, teamId]);
    _ref.watch(teamDataProvider(teamId).notifier).update(
          (state) => TeamInfo(
            id: teamId,
            name: team.name,
            description: team.description,
            members: aliceAddMember,
          ),
        );
    _ref.read(addTeamInfoProvider.notifier).update((state) => const AddTeam());
    // TODO(yodai-hi): ここでTeamUpdateのAPIを呼ぶ
  }

  Future<void> addTeamMember(String teamId) async {
    final members = _ref.read(updateMemberWalletAddressProvider);
    final teamInfo = _ref.read(teamDataProvider(teamId));
    // TODO(yodai-hi): ここでTeamUpdateのAPIを呼ぶ
  }

  Future<void> deleteTeamMember(String teamId, String walletAddress) async {
    // TODO(yodai-hi): ここでTeamUpdateのAPIを呼ぶ
  }

  Future<void> updateTeamInfo(String teamId) async {
    // TODO(yodai-hi): ここでTeamUpdateのAPIを呼ぶ
  }
}
