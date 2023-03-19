import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:time_dex/global/providers.dart';

import 'api_client_repository.dart';

abstract class WalletApiRepository {
  Future<String?> getUserIdByWalletAddress(String walletAddress);
}

final walletApiRepositoryProvider = Provider<WalletApiRepository>(
  WalletApiRepositoryImpl.new,
);

class WalletApiRepositoryImpl extends WalletApiRepository {
  WalletApiRepositoryImpl(this.ref) {
    final client = ref.watch(apiClientRepository);
    api = WalletApi(client);
  }
  final Ref ref;
  late WalletApi api;

  @override
  Future<String?> getUserIdByWalletAddress(String walletAddress) async {
    try {
      final jwt = await _getJWT();
      final response = await api.getUserIdByWalletAddress(jwt, walletAddress);
      return response?.userId;
    } on Exception catch (err) {
      ref.watch(loggerProvider).e(err);
      return null;
    }
  }

  Future<String> _getJWT() async {
    final jwt = await ref.watch(secureStorageProvider).read(key: 'jwt');
    if (jwt == null) {
      throw Exception('Access token in not exists');
    }
    return jwt;
  }
}
