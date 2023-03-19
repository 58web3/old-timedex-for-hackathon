import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_dex/global/repositories.dart';
import 'package:time_dex/pages/onboard/providers.dart';

import '../providers.dart';
import '../usecases.dart';

final authenticationManageUsecaseProvider =
    Provider<AuthenticationManageUsecase>(
  (ref) => AuthenticationManageUsecase(ref: ref),
);

class AuthenticationManageUsecase {
  AuthenticationManageUsecase({
    required Ref ref,
  }) : _ref = ref;

  final Ref _ref;

  Future<String> startAuth(String walletAddress) async {
    _ref.watch(currentUserWalletProvider.notifier).update((_) => walletAddress);

    // Userデータが存在するか確認
    final userId = await _ref
        .read(walletApiRepositoryProvider)
        .getUserIdByWalletAddress(walletAddress);
    if (userId == null) {
      // Nullの場合オンボードに遷移
      return 'onboard';
    }

    await getJwt(walletAddress);

    // ユーザデータを取得
    final user = await _ref.read(userApiRepositoryProvider).getUser(userId);
    _ref.watch(currentUserProvider.notifier).update((_) => user);

    // チームデータを取得
    final userTeams = await _ref.read(teamApiRepositoryProvider).getUserTeams();
    _ref.watch(joiningTeamsProvider.notifier).update((_) => userTeams);
    return 'home';
  }

  Future<void> startSignup() async {
    final account = _ref.watch(accountStatusProvider);
    await _ref.watch(userApiRepositoryProvider).addUser({
      'walletAddress': account.walletAddress,
      'nickname': account.nickName,
      'email': account.email,
    });

    await getJwt(account.walletAddress);

    final calendars = _ref.watch(calendarProvider);
    final googleCalendars = calendars.google;

    // 自分のカレンダーを作成する　OR 更新する
    final calendarId =
        await _ref.watch(calendarApiRepositoryProvider).publishCalendar(
              calendars,
              googleCalendars,
            );
    // Calendar IDを保持する
    await _ref.watch(secureStorageProvider).write(
          key: 'calendar_id',
          value: calendarId,
        );
  }

  Future<String> getJwt(String walletAddress) async {
    final savedJwt = await _ref.watch(secureStorageProvider).read(key: 'jwt');
    if (savedJwt != null) {
      return savedJwt;
    } else {
      final nonce = await _ref
          .watch(authenticationApiRepositoryProvider)
          .generateNonce(walletAddress);
      final sig = await _ref
          .read(web3ConnectUsecaseProvider)
          .requestSignature(walletAddress, nonce);

      final jwt = await _ref
          .watch(authenticationApiRepositoryProvider)
          .verifySignature(walletAddress, sig);

      await _ref.watch(secureStorageProvider).write(key: 'jwt', value: jwt);
      return jwt;
    }
  }
}
