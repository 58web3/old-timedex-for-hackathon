# openapi.api.UserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:50001*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addUser**](UserApi.md#adduser) | **POST** /v1/user | Create new user
[**getUser**](UserApi.md#getuser) | **GET** /v1/user/{user_id} | Get user info
[**updateDelegator**](UserApi.md#updatedelegator) | **PUT** /v1/user/{user_id}/delegator | Update delegator
[**updateUser**](UserApi.md#updateuser) | **PUT** /v1/user/{user_id} | Update new user


# **addUser**
> CommonResponse addUser(user)

Create new user

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final user = User(); // User | 

try {
    final result = api_instance.addUser(user);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->addUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | [**User**](User.md)|  | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUser**
> User getUser(authorization, userId)

Get user info

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final authorization = Bearer xxx; // String | JWT
final userId = 9490ebf5-e378-4074-97d0-3ce5004ae918; // String | User ID

try {
    final result = api_instance.getUser(authorization, userId);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->getUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **userId** | **String**| User ID | 

### Return type

[**User**](User.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDelegator**
> CommonResponse updateDelegator(authorization, userId, user)

Update delegator

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final authorization = Bearer xxx; // String | JWT
final userId = 9490ebf5-e378-4074-97d0-3ce5004ae918; // String | User ID
final user = User(); // User | 

try {
    final result = api_instance.updateDelegator(authorization, userId, user);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->updateDelegator: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **userId** | **String**| User ID | 
 **user** | [**User**](User.md)|  | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUser**
> CommonResponse updateUser(authorization, userId, user)

Update new user

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final authorization = Bearer xxx; // String | JWT
final userId = 9490ebf5-e378-4074-97d0-3ce5004ae918; // String | User ID
final user = User(); // User | 

try {
    final result = api_instance.updateUser(authorization, userId, user);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->updateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **userId** | **String**| User ID | 
 **user** | [**User**](User.md)|  | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

