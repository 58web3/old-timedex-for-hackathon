# openapi.api.WalletApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:50001*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUserIdByWalletAddress**](WalletApi.md#getuseridbywalletaddress) | **GET** /v1/wallet/{wallet_address}/user_id | Get User ID by wallet_address


# **getUserIdByWalletAddress**
> WalletUser getUserIdByWalletAddress(authorization, walletAddress)

Get User ID by wallet_address

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = WalletApi();
final authorization = Bearer xxx; // String | JWT
final walletAddress = 0x60f80121c31a0d46b5279700f9df786054aa5ee6; // String | Wallet Address

try {
    final result = api_instance.getUserIdByWalletAddress(authorization, walletAddress);
    print(result);
} catch (e) {
    print('Exception when calling WalletApi->getUserIdByWalletAddress: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **walletAddress** | **String**| Wallet Address | 

### Return type

[**WalletUser**](WalletUser.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

