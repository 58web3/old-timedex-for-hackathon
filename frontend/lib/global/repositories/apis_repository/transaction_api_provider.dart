import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart';

import 'api_client_repository.dart';

abstract class TransactionApiProvider {
  Future<void> sendTransaction(
    String jwt, {
    required SendTransactionRequest req,
  });
}

final transactionApiProviderProvider = Provider<TransactionApiProvider>(
  TransactionApiProviderImpl.new,
);

class TransactionApiProviderImpl extends TransactionApiProvider {
  TransactionApiProviderImpl(this.ref) {
    final client = ref.watch(apiClientRepository);
    api = TransactionApi(client);
  }
  final Ref ref;
  late TransactionApi api;

  @override
  Future<void> sendTransaction(
    String jwt, {
    required SendTransactionRequest req,
  }) async {
    late SendTransactionResponse? response;
    try {
      response = await api.sendTransaction(jwt, sendTransactionRequest: req);
      if (response == null) {
        throw Exception('sendTransaction response is null');
      }
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
