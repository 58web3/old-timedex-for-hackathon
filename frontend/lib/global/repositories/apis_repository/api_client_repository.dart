import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/values.dart';
import 'package:time_dex/global/providers.dart';

final apiClientRepository = Provider<ApiClient>((ref) {
  late ApiClient client;
  switch (ref.watch(flavorProvider)) {
    case FlavorType.dev:
      // ignore: avoid_redundant_argument_values
      client = ApiClient(basePath: baseBackendUrlDev);
      break;
    case FlavorType.stg:
      client = ApiClient(basePath: baseBackendUrlStg);
      break;
    case FlavorType.prod:
      client = ApiClient(basePath: baseBackendUrlProd);
      break;
  }

  return client;
  // TODO(yodai-hi): 必要なheader設定があればここで追加
  // ..addDefaultHeader('key', 'value');
});
