import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';

import 'api_client_repository.dart';

abstract class AuthenticationApiRepository {
  Future<String> generateNonce(String walletAddress);
  Future<String> verifySignature(
    String walletAddress,
    String signature,
  );
}

final authenticationApiRepositoryProvider =
    Provider<AuthenticationApiRepository>(
  AuthenticationApiRepositoryImpl.new,
);

class AuthenticationApiRepositoryImpl extends AuthenticationApiRepository {
  AuthenticationApiRepositoryImpl(this.ref) {
    final client = ref.watch(apiClientRepository);
    api = AuthenticationApi(client);
  }
  final Ref ref;
  late AuthenticationApi api;

  @override
  Future<String> generateNonce(String walletAddress) async {
    try {
      final req = AuthNonceRequest(walletAddress: walletAddress);
      final response = await api.generateNonce(authNonceRequest: req);
      final nonce = response?.nonce;
      if (nonce == null) {
        throw Exception('nonce value is null');
      }
      return nonce;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<String> verifySignature(
    String walletAddress,
    String signature,
  ) async {
    try {
      final req = VerifyRequest(
        walletAddress: walletAddress,
        signature: signature,
      );
      final response = await api.verifySignature(verifyRequest: req);
      final jwt = response?.jwt;
      if (jwt == null) {
        throw Exception('jwt value is null');
      }
      return jwt;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
