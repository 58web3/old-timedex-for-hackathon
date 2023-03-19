import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_dex/global/providers.dart';
import 'package:time_dex/global/usecases.dart';

import '../providers.dart';
import '../states.dart';

final delegationUsecaseProvider = Provider<DelegationUsecase>(
  (ref) => DelegationUsecase(ref: ref),
);

class DelegationUsecase {
  DelegationUsecase({
    required Ref ref,
  }) : _ref = ref;

  final Ref _ref;

  Future<void> fetchDelegationStatus() async {
    // TODO(yodai-hi): カレンダーを委任した人，された人を取得
    final delegatedToMemberId = <String>[];
    final delegatedFromMemberId = <String>[];

    final delegatedToMembers = <DelegationInfo>[];
    final delegatedFromMembers = <DelegationInfo>[];

    for (final id in delegatedToMemberId) {
      // TODO(yodai-hi): /v1/user/で詳細情報を取得
      // delegatedToMembers.add();
    }

    for (final id in delegatedFromMemberId) {
      // TODO(yodai-hi): /v1/user/で詳細情報を取得
      // delegatedFromMembers.add();
    }

    _ref.read(delegatedToMemberProvider.notifier).update(
          (_) => delegatedToMembers,
        );
    _ref.read(delegatedFromMemberProvider.notifier).update(
          (_) => delegatedFromMembers,
        );
  }

  Future<void> delegateToTeamMember(List<String> targetWalletAddresses) async {
    // TODO(yodai-hi): 自分のWAを取得
    final userWalletAddress = _ref.read(currentUserWalletProvider);
    if (userWalletAddress == null) {
      throw Exception('wallet address is null');
    }
    // TODO(yodai-hi): 署名を作成？
    final nonce = await _generateNonce(userWalletAddress);
    final signature = await _requestSignature(userWalletAddress, nonce);
    // TODO(yodai-hi): delegationをリクエスト
    for (final target in targetWalletAddresses) {}
  }

  Future<void> deleteFromDelegationMembers(String walletAddress) async {
    // TODO(yodai-hi): 自分のWAを取得
    final userWalletAddress = _ref.read(currentUserWalletProvider);
    if (userWalletAddress == null) {
      throw Exception('wallet address is null');
    }
    // TODO(yodai-hi): 署名を作成？
    final nonce = await _generateNonce(userWalletAddress);
    final signature = await _requestSignature(userWalletAddress, nonce);
    // TODO(yodai-hi): delegationを確認
  }

  Future<String> _generateNonce(String walletAddress) async {
    try {
      // "/v1/auth/generate-nonce" を呼び出す
      return '';
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  Future<String> _requestSignature(String wa, String nonce) async {
    try {
      // メッセージを署名する
      return _ref.read(web3ConnectUsecaseProvider).requestSignature(wa, nonce);
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }
}
