import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web3/flutter_web3.dart' as w3;
import 'package:time_dex/global/models.dart';
import 'package:time_dex/global/providers.dart';

final web3ConnectUsecaseProvider = Provider<Web3ConnectUsecase>(
  (ref) => Web3ConnectUsecase(ref: ref),
);

class Web3ConnectUsecase {
  Web3ConnectUsecase({
    required Ref ref,
  }) : _ref = ref {
    if (w3.Ethereum.isSupported) {
      w3.ethereum!.onAccountsChanged((account) {
        clear();
      });

      w3.ethereum!.onChainChanged((chain) {
        clear();
      });
    }
  }

  final Ref _ref;
  final wcProvider = w3.WalletConnectProvider.fromRpc(
    {int.parse(dotenv.get('CHAIN_ID')): dotenv.get('CHAIN_ENDPOINT')},
    chainId: int.parse(dotenv.get('CHAIN_ID')),
    network: dotenv.get('CHAIN_NETWORK'),
  );

  Future<void> connectWallet() async {
    try {
      await wcProvider.connect();
      if (wcProvider.connected) {
        final reqState = WalletConnectRequestState(
          currentAddress: wcProvider.accounts.first,
          currentChain: int.parse(wcProvider.chainId),
          isConnected: true,
        );
        _ref.watch(wcConnectState.notifier).update((state) => reqState);
      }
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  Future<void> disconnectWallet() async {
    try {
      await wcProvider.disconnect();
      const reqState = WalletConnectRequestState();
      _ref.watch(wcConnectState.notifier).update((state) => reqState);
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  Future<String> requestSignature(String wa, String message) async {
    try {
      // メッセージを署名する
      final signature = await wcProvider.request<String>(
        'personal_sign',
        [message, wa],
      );
      return signature;
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  Future<void> connectProvider() async {
    if (w3.Ethereum.isSupported) {
      final account = await w3.ethereum!.requestAccount();
      if (account.isNotEmpty) {
        final chain = await w3.ethereum!.getChainId();
        _ref.watch(wcConnectState.notifier).update(
              (state) => state.copyWith(
                currentAddress: account.first,
                currentChain: chain,
                isConnected: true,
              ),
            );
      }
    }
  }

  void clear() {
    _ref.watch(wcConnectState.notifier).update(
          (state) => const WalletConnectRequestState(),
        );
  }

    Future<String?> requestMetamaskSignature(String wa, String message) async {
    try {
      // メッセージを署名する
      String prefix = "\x19Ethereum Signed Message:\n";
      String hexMessage = stringToHex("$prefix$message");
      final String? signature = await w3.ethereum?.request<String>(
        'personal_sign',
        [hexMessage, wa],
      );
      return signature;
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }


  String stringToHex(String input) {
    var bytes = utf8.encode(input); // UTF-8エンコードされたバイト配列を取得
    var hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(''); // バイト配列をhex文字列に変換
    return hex;
  }
}
