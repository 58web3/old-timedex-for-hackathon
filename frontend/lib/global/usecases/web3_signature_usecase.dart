import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final web3SignatureUsecaseProvider = Provider<Web3SignatureUsecase>(
  (ref) => Web3SignatureUsecase(ref: ref),
);

class Web3SignatureUsecase {
  Web3SignatureUsecase({
    required Ref ref,
  }) : _ref = ref;

  final Ref _ref;
  Future<String> generateNonce(String walletAddress) async {
    // try {
    //   // "/v1/auth/generate-nonce" を呼び出す
    //   Uri url = Uri.parse('');
    //   Map<String, String> headers = {'content-type': 'application/json'};
    //   String body = json.encode({'wallet_address': walletAddress});
    //   http.Response resp = await http.post(url, headers: headers, body: body);
    //   if (resp.statusCode == 200) {
    //     return jsonDecode(resp.body)['nonce'] as String;
    //   }
    //   return '';
    // } on Exception catch (err) {
    //   _ref.watch(loggerProvider).e(err);
    //   rethrow;
    // }
    return '';
  }

  Future<String> requestSignature(String wa, String nonce) async {
    // try {
    //   // メッセージを署名する
    //   return _ref.read(web3ConnectUsecaseProvider).requestSignature(wa, nonce);
    // } on Exception catch (err) {
    //   _ref.watch(loggerProvider).e(err);
    //   rethrow;
    // }
    return '';
  }
}
