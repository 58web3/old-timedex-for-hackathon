# openapi.api.TransactionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:50001*

Method | HTTP request | Description
------------- | ------------- | -------------
[**sendTransaction**](TransactionApi.md#sendtransaction) | **POST** /v1/send/transaction | Execute transaction


# **sendTransaction**
> SendTransactionResponse sendTransaction(authorization, sendTransactionRequest)

Execute transaction

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TransactionApi();
final authorization = Bearer xxx; // String | JWT
final sendTransactionRequest = SendTransactionRequest(); // SendTransactionRequest | 

try {
    final result = api_instance.sendTransaction(authorization, sendTransactionRequest);
    print(result);
} catch (e) {
    print('Exception when calling TransactionApi->sendTransaction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **sendTransactionRequest** | [**SendTransactionRequest**](SendTransactionRequest.md)|  | [optional] 

### Return type

[**SendTransactionResponse**](SendTransactionResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

