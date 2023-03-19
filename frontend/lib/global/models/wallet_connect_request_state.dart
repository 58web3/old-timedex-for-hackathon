import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/wallet_connect_request_state.freezed.dart';

@freezed
class WalletConnectRequestState with _$WalletConnectRequestState {
  const factory WalletConnectRequestState({
    @Default('') String currentAddress,
    @Default(-1) int currentChain,
    @Default(false) bool isConnected,
  }) = _WalletConnectRequestState;
}
