# openapi.api.AuthenticationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:50001*

Method | HTTP request | Description
------------- | ------------- | -------------
[**generateNonce**](AuthenticationApi.md#generatenonce) | **POST** /v1/auth/generate-nonce | Generate nonce
[**verifySignature**](AuthenticationApi.md#verifysignature) | **POST** /v1/auth/login | Verify signature and return JWT


# **generateNonce**
> AuthNonceResponse generateNonce(authNonceRequest)

Generate nonce

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthenticationApi();
final authNonceRequest = AuthNonceRequest(); // AuthNonceRequest | 

try {
    final result = api_instance.generateNonce(authNonceRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthenticationApi->generateNonce: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authNonceRequest** | [**AuthNonceRequest**](AuthNonceRequest.md)|  | [optional] 

### Return type

[**AuthNonceResponse**](AuthNonceResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifySignature**
> VerifyResponse verifySignature(verifyRequest)

Verify signature and return JWT

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthenticationApi();
final verifyRequest = VerifyRequest(); // VerifyRequest | 

try {
    final result = api_instance.verifySignature(verifyRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthenticationApi->verifySignature: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyRequest** | [**VerifyRequest**](VerifyRequest.md)|  | [optional] 

### Return type

[**VerifyResponse**](VerifyResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

