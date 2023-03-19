import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';

// flavorタイプを保持(dev/stg/prod)
final flavorProvider = Provider<FlavorType>(
  (_) => throw UnimplementedError(),
);

// buildタイプを保持(debug/release)
final debugProvider = StateProvider<bool>(
  (ref) => throw UnimplementedError(),
);
